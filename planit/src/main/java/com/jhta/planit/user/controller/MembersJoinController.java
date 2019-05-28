package com.jhta.planit.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class MembersJoinController {
	@Autowired private MembersService service;
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MembersVo vo, Model model) {
		int n = service.membersJoin(vo);
		if (n>0) {
			return "redirect:/"	;
		}else {
			model.addAttribute("vo", vo);
			return "member/join";
		}
	}
	
	@RequestMapping(value = "/join/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public int idcheck(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		System.out.println(mem_id);
		MembersVo vo = service.idCheck(mem_id);

		int result = 0;
		if (vo != null) {
			result = 1;
		}
		return result;
	}
	

	@RequestMapping(value = "/join/nickcheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickcheck(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		MembersVo vo = service.idCheck(mem_id);

		int result = 0;
		if (vo != null) {
			result = 1;
		}
		return result;
	}
	

	@RequestMapping(value = "/join/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public int emailcheck(HttpServletRequest request) {
		String mem_email = request.getParameter("mem_email");
		System.out.println(mem_email);
		MembersVo vo = service.emailCheck(mem_email);

		int result = 0;
		if (vo != null) {
			result = 1;
		}
		return result;
	}
}
