package com.jhta.planit.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.user.service.MypageService;

@Controller
public class MypageController {
	@Autowired private MypageService service;

	@RequestMapping(value = "/member/mypage/{mem_id}", method = RequestMethod.GET)
	public ModelAndView mypageMain(@PathVariable String mem_id, HttpSession session) {
		HashMap<Object, Object> map=service.profileInfo(mem_id);
		ModelAndView mv=new ModelAndView(".member.mypage");
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("map", map);
		return mv;
	}

	@RequestMapping(value = "/member/mypage/{mem_id}/{content}")
	public ModelAndView mypageContent(@PathVariable("mem_id") String mem_id, @PathVariable("content") String content, HttpSession session) {
		ModelAndView mv=new ModelAndView(".member.mypage");
		mv.addObject("content", content);
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		return mv;
	}

	public boolean acc_member(String mem_id, String mypagemem_id) {
		if (mem_id.equals(mypagemem_id)) {
			return true;
		} else {
			return false;
		}
	}
}
