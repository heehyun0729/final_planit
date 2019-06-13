package com.jhta.planit.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.service.UserSellerService;
import com.jhta.planit.user.vo.SellerVo;

@Controller
public class SellerJoinController {
	@Autowired private UserSellerService service;
	@Autowired private MembersService mservice;
	
	@RequestMapping(value = "/user/sellerapply", method = RequestMethod.GET)
	public String sellJoinForm(HttpSession session, RedirectAttributes attributes) {
		if (session.getAttribute("mem_id") != null) {
			return "/user/sellerapply";
		} else {
			attributes.addFlashAttribute("errMsg", "�α����� �Ǿ�� ����� �� �ִ� ����Դϴ�.");
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/user/sellerapply",method = RequestMethod.POST)
	public String sellJoin(SellerVo vo, String mem_pwd, HttpSession session, Model model, RedirectAttributes attributes) {
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("mem_id", (String)session.getAttribute("mem_id"));
		map.put("mem_pwd", mem_pwd);
		if(mservice.userCheck(map)) {
			vo.setMem_id(map.get("mem_id"));
			System.out.println(vo.toString());
			if (service.sellJoin(vo) > 0) {
				attributes.addFlashAttribute("authMsg", "��û�� �Ϸ�Ǿ����ϴ�. ���� �ð����� �Ϸ� �ɸ��ϴ�");
				return "redirect:/member/result";
			} else {
				model.addAttribute("vo", vo);
				model.addAttribute("submitError", "�۾��� ������ ���� ��ҵǾ����ϴ�.");
				return "/user/sellerapply";
			}
		}else {
			model.addAttribute("vo", vo);
			model.addAttribute("errMsg", "��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
			return "/user/sellerapply";
		}
		
	}
}
