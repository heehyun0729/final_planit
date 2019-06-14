package com.jhta.planit.accom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.roomImage.service.RoomImageService;


@Controller
public class AccomDeleteController {
	@Autowired private AccomService service;
	public void setService(AccomService service){
		this.service=service;
	}
	
	@RequestMapping("/accomDelete")
	public String delete(@RequestParam(value="accom_num", required=true) int accom_num, Model model) {
		int n =service.updateAccomCheck(accom_num);
		if(n>0) {
			return "redirect:/accommList";
		}else {
			model.addAttribute("result","fail");
			return "result";
		}
	}
	@RequestMapping("/admin/accomDelete")
	public String delete1(@RequestParam(value="accom_num", required=true) int accom_num, Model model) {
		int n =service.updateAccomCheck(accom_num);
		if(n>0) {
			return "redirect:/admin/accommList";
		}else {
			model.addAttribute("result","fail");
			return "result";
		}
	}
}
