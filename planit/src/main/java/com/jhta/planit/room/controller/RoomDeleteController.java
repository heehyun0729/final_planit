package com.jhta.planit.room.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.roomImage.service.RoomImageService;


@Controller
public class RoomDeleteController {
	@Autowired private RoomService service;
	public void setService(RoomService service){
		this.service=service;
	}
	
	@RequestMapping("/roomDelete")
	public String delete(@RequestParam(value="accom_num", required=true) int accom_num, @RequestParam(value="room_num", required=true) int room_num, Model model) {
		int n =service.updateRoomCheck(room_num);
		if(n>0) {
			return "redirect:/roomList?accom_num="+accom_num;
		}else {
			model.addAttribute("result","fail");
			return "result";
		}
	}
}
