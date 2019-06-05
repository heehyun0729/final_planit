package com.jhta.planit.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.planit.user.service.MembersService;

@Controller
public class SellerJoinController {
	@Autowired MembersService service;
	
	@RequestMapping(value = "/user/sellerapply", method = RequestMethod.GET)
	public String sellJoinForm(HttpSession session, RedirectAttributes attributes) {
		if (session.getAttribute("mem_id") != null) {
			return "/user/sellerapply";
		} else {
			attributes.addFlashAttribute("errMsg", "로그인이 되어야 사용할 수 있는 기능입니다.");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/user/sellerapply",method = RequestMethod.POST)
	public String sellJoin(Model model,RedirectAttributes attributes) {
		/*int n = service.sellJoin(vo);
		if (n>0) {
			attributes.addFlashAttribute("authMsg", "가입이 완료되었습니다. 메일 인증해 주시기 바랍니다.");
			return "redirect:/member/result";
		}else {
			model.addAttribute("vo", vo);
			return "user/join";
		}*/
		return null;
	}
}
