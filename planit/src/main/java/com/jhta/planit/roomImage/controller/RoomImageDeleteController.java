package com.jhta.planit.roomImage.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.roomImage.service.RoomImageService;


@Controller
public class RoomImageDeleteController {
	@Autowired private RoomImageService service;
	public void setService(RoomImageService service){
		this.service=service;
	}
	
	@RequestMapping("/roomImageDelete")
	public String delete(@RequestParam(value="accom_num", required=true) int accom_num, @RequestParam(value="roomImg_num", required=true) int roomImg_num, Model model) {
		int n =service.updateImgCheck(roomImg_num);
		if(n>0) {
			return "redirect:/roomList?accom_num="+accom_num;
		}else {
			model.addAttribute("result","fail");
			return "result";
		}
	}
}
