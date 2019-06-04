package com.jhta.planit.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.vo.MembersVo;

@Controller
public class EditUserInfoController {
	@Autowired private MembersService service;
	
	@RequestMapping(value = "/user/edit/{editInfo}", method = RequestMethod.GET)
	public String editUsercheckForm(@PathVariable String editInfo, HttpSession session, RedirectAttributes attributes,Model model) {
		String mem_id = (String) session.getAttribute("mem_id");
		if (mem_id == null) {
			attributes.addFlashAttribute("errMsg", "�α����� �Ǿ�� ����� �� �ִ� ����Դϴ�.");
			return "redirect:/login";
		} else {
			if (editInfo.equals("editprofile")) {
				return "/user/editUserChk";
			} else if (editInfo.equals("pwdChange")) {
				model.addAttribute("forgot", false);
				model.addAttribute("mem_id", mem_id);
				return "/user/pwdChange";
			} else if (editInfo.equals("withdrawal")) {
				return "/user/withdrawal";
			} else {
				return "redirect: /member/mypage/" + mem_id;
			}
		}
	}
	
	@RequestMapping(value = "/user/edituserinfochk", method = RequestMethod.POST)
	public ModelAndView editUsercheck(String mem_pwd, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", (String) session.getAttribute("mem_id"));
		map.put("mem_pwd", mem_pwd);
		MembersVo vo = service.userInfo(map);
		ModelAndView mv = new ModelAndView();
		if (vo != null) {
			mv.addObject("vo", vo);
			mv.setViewName("/user/editprofile");
		} else {
			mv.addObject("errMsg", "������ �ùٸ��� �ʽ��ϴ�.");
			mv.setViewName("/user/editUserChk");
		}
		return mv;
	}
	
	@RequestMapping(value = "/user/pwdchange", method = RequestMethod.POST)
	public String pwdChange(String mem_id, boolean forgot, String before_mem_pwd, String mem_pwd,
			RedirectAttributes attributes, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("before_mem_pwd", before_mem_pwd);
		map.put("mem_pwd", mem_pwd);
		map.put("forgot", forgot);
		int n = service.pwdChange(map);
		if (n > 0) {
			attributes.addFlashAttribute("authMsg", "��й�ȣ�� �����Ǿ����ϴ�.");
			return "redirect:/member/result";
		} else if (n < -9) {
			model.addAttribute("errMsg", "��й�ȣ�� �߸��Ǿ����ϴ�.");
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("forgot", forgot);
			return "/user/pwdChange";
		} else {
			model.addAttribute("errMsg", "������ ���� �������� �ʾҽ��ϴ�.");
			model.addAttribute("mem_id", mem_id);
			model.addAttribute("forgot", forgot);
			return "/user/pwdChange";
		}
	}

	@RequestMapping(value = "/user/editprofile", method = RequestMethod.POST)
	public String editUserChange(MembersVo vo, Model model, RedirectAttributes attributes) throws Exception {
		/*int n = service.editUserInfo(vo);
		if (n > 0) {
			attributes.addFlashAttribute("authMsg", "ȸ�������� �����Ǿ����ϴ�.");
			return "redirect:/member/result";
		} else {
			model.addAttribute("vo", vo);
			return "user/join";
		}*/
		return null;
	}
}
