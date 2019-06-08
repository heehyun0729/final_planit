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

@Controller
public class RoomListController {
	@Autowired private RoomService service;
	public void setService(RoomService service) {
		this.service = service;
	}
	@RequestMapping(value="/roomList")
	public ModelAndView roomList(@RequestParam(value="accom_num", required=true) int accom_num) {
		
		List<RoomVo> list = service.list(accom_num);

		ModelAndView mv=new ModelAndView("/room/roomList");
		mv.addObject("accom_num",accom_num);
		mv.addObject("list",list);
		
		return mv;
	}
}
