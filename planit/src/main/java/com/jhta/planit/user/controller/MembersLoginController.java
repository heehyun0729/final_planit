package com.jhta.planit.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.planit.user.service.MembersService;

@Controller
public class MembersLoginController {
	@Autowired private MembersService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String mem_id, String mem_pwd, Model model, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		boolean result = service.login(map);
		if (result) {
			session.setAttribute("mem_id", mem_id);
			return "redirect:/";
		} else {
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("errMsg", "�α��� ������ �ùٸ��� �ʽ��ϴ�.");
			return "member/login";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}