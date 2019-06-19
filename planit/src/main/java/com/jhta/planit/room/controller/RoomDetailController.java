package com.jhta.planit.room.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.service.RoomImageService;
import com.jhta.planit.roomImage.vo.RoomImageVo;
import com.jhta.util.PageUtil;

@Controller
public class RoomDetailController {
	@Autowired
	private RoomService service;
	@Autowired
	private RoomImageService service1;
	public void setService(RoomService service) {
		this.service = service;
	}
	public void setService1(RoomImageService service1) {
		this.service1 = service1;
	}

	@RequestMapping(value = "/roomDetail")
	public ModelAndView roomList(int accom_num,int room_num) {
		RoomVo vo = service.detail1(room_num);
		List<RoomImageVo> vo1= service1.list1(room_num);
		ModelAndView mv = new ModelAndView("-room-roomDetail");
		mv.addObject("vo", vo);
		mv.addObject("vo1", vo1);
		mv.addObject("accom_num",accom_num);
		return mv;
	}
}
