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
import com.jhta.util.PageUtil;

@Controller
public class RoomListController {
	@Autowired
	private RoomService service;

	public void setService(RoomService service) {
		this.service = service;
	}

	@RequestMapping(value = "/roomList")
	public ModelAndView roomList(@RequestParam(value = "accom_num", required = true) int accom_num,
			@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String field, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("accom_num", accom_num);
		// 전체 글의갯수
		int totalRowCount = service.count(map);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<RoomVo> list = service.list(map);
		ModelAndView mv = new ModelAndView(".room.roomList");
		mv.addObject("accom_num", accom_num);
		mv.addObject("list", list);
		mv.addObject("pu",pu);
		mv.addObject("field",field);
		mv.addObject("keyword",keyword);
		return mv;
	}
}
