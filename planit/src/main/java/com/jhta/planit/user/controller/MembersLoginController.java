package com.jhta.planit.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.user.service.MembersService;

@Controller
public class MembersLoginController {
	@Autowired private MembersService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping(value = "/login", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String login(String mem_id, String mem_pwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		boolean result = service.login(map);
		if (result) {
			return "success";
		} else {
			return "error";
		}
	}
}
