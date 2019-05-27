package com.jhta.planit.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.planit.user.service.MembersJoinService;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class MembersJoinController {
	@Autowired MembersJoinService service;
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MembersVo vo, Model model) {
		System.out.println("id:"+vo.getMem_id());
		System.out.println("pwd:"+vo.getMem_pwd());
		System.out.println("nickname:"+vo.getMem_nickname());
		System.out.println("email:"+vo.getMem_email());
		System.out.println("gender:"+vo.getMem_gender());
		System.out.println("birth:"+vo.getMem_birthyear());
		System.out.println("api:"+vo.getMem_api());
		int n = service.membersJoin(vo);
		if (n>0) {
			return "redirect:/"	;
		}else {
			model.addAttribute("vo", vo);
			return "member/join";
		}
		
	}
}
