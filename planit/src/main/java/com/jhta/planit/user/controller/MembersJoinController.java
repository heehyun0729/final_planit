package com.jhta.planit.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class MembersJoinController {
	@Autowired private MembersService service;
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinchoiceForm() {
		return "member/joinchoice";
	}
	
	@RequestMapping(value = "/nomaljoin", method = RequestMethod.GET)
	public String joinForm() {
		return "member/join";
	}

	@RequestMapping(value = "/nomaljoin", method = RequestMethod.POST)
	public String join(MembersVo vo, Model model,RedirectAttributes attributes) throws Exception{
		int n = service.membersJoin(vo);

		System.out.println("@@@@@!!!!!!!!! testcontroller !!!!!!!!!!!!@@@@@@@@@@@@");
		if (n>0) {
			attributes.addFlashAttribute("authMsg", "메일인증을 완료해 주시기 바랍니다");
			return "redirect:/"	;
		}else {
			model.addAttribute("vo", vo);
			return "member/join";
		}
	}
	
	@RequestMapping(value = "/nomaljoin/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public int idcheck(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		MembersVo vo = service.idCheck(mem_id);

		int result = 0;
		if (vo != null) {
			result = 1;
		}
		return result;
	}
	

	@RequestMapping(value = "/nomaljoin/nickcheck", method = RequestMethod.POST)
	@ResponseBody
	public int nickcheck(HttpServletRequest request) {
		String mem_nickname = request.getParameter("mem_nickname");
		MembersVo vo = service.nickCheck(mem_nickname);

		int result = 0;
		if (vo != null) {
			result = 1;
		}
		return result;
	}
	

	@RequestMapping(value = "/nomaljoin/emailcheck", method = RequestMethod.POST)
	@ResponseBody
	public int emailcheck(HttpServletRequest request) {
		String mem_email = request.getParameter("mem_email");
		MembersVo vo = service.emailCheck(mem_email);

		int result = 0;
		if (vo != null) {
			result = 1;
		}
		return result;
	}
}
