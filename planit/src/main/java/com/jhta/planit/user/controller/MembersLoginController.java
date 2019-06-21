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

	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String loginForm() {
		return "!user!login";
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public String login(String mem_id, String mem_pwd, Model model, HttpSession session) {
		String referer = (String)session.getAttribute("referer");
		session.removeAttribute("referer");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd", mem_pwd);
		int result = service.login(map);
		if (result > -2) {
			session.setAttribute("mem_id", mem_id);
			session.setAttribute("mem_stat", result);
			if(referer != null && referer != "") {
				return "redirect:" + referer;
			}else {
				return "redirect:/";
			}
		} else {
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			return "!user!login";
		}
		/*if (result >= 0) {
			session.setAttribute("mem_id", mem_id);
			return "redirect:/";
		} else {
			model.addAttribute("mem_id", mem_id);
			if (result == -1) {
				model.addAttribute("errMsg", "이메일 인증을 완료해 주세요");
			} else {
				model.addAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			}
			return "user/login";
		}*/

	}

	@RequestMapping(value = "/user/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
