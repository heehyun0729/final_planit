package com.jhta.planit.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
