package com.jhta.planit.user.controller;

import java.util.HashMap;
import java.util.List;

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
		HashMap<Object, Object> profilemap=service.profileInfo(mem_id);
		ModelAndView mv=new ModelAndView(".member.mypage");
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap);
		return mv;
	}

	@RequestMapping(value = "/member/mypage/{mem_id}/{content}")
	public ModelAndView mypageContent(@PathVariable("mem_id") String mem_id, @PathVariable("content") String content,
			HttpSession session) {
		HashMap<Object, Object> profilemap = service.profileInfo(mem_id);
		List<HashMap<Object, Object>> contentlist;
		ModelAndView mv = new ModelAndView(".member.mypage");
		if (content.equals("followedlist")) {
			contentlist = service.followedlist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("followlist")) {
			contentlist = service.followlist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("postslist")) {
			contentlist = service.postslist(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("travel")) {
			contentlist = service.travel(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("comments")) {
			contentlist = service.comments(mem_id);
			mv.addObject("contentmap", contentlist);
		} else if (content.equals("book")) {
			contentlist = service.book(mem_id);
			mv.addObject("contentmap", contentlist);
		}
		mv.addObject("content", content);
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap);
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
