package com.jhta.planit.user.controller;

import java.util.HashMap;

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
	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
	public String joinchoiceForm() {
		return "user/joinchoice";
	}
	
	@RequestMapping(value = "/user/nomaljoin", method = RequestMethod.GET)
	public String joinForm() {
		return "user/join";
	}

	@RequestMapping(value = "/user/nomaljoin", method = RequestMethod.POST)
	public String join(MembersVo vo, Model model, RedirectAttributes attributes) throws Exception{
		int n = service.membersJoin(vo);
		if (n>0) {
			attributes.addFlashAttribute("authMsg", "������ �Ϸ�Ǿ����ϴ�. ���� ������ �ֽñ� �ٶ��ϴ�.");
			return "redirect:/member/result";
		}else {
			model.addAttribute("vo", vo);
			return "user/join";
		}
	}
	
	@RequestMapping(value = "/user/idcheck", method = RequestMethod.POST)
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

	@RequestMapping(value = "/user/nickcheck", method = RequestMethod.POST)
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
	
	@RequestMapping(value = "/user/emailcheck", method = RequestMethod.POST)
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
	
	@RequestMapping("/member/result")
	public String result(){
		return ".member.result";
	}
	
	@RequestMapping(value = "/member/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String mem_email, String key, RedirectAttributes attributes) throws Exception { // �̸�������
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("mem_email", mem_email);
		map.put("authKey", key);
		int n = service.userAuth(map);
		if (n>0) {
			String mem_id=service.getId(mem_email);
			attributes.addFlashAttribute("authMsg", mem_id+"���� ������ �������ϴ�. ȸ�������� �������� �����մϴ�.");
		}else {
			attributes.addFlashAttribute("authMsg", "������ �Ϸ�Ǿ��ų� �������� �ʴ� ȸ���Դϴ�.");
		}
		return "redirect:/member/result";
	}
}
