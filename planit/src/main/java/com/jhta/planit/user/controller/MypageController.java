package com.jhta.planit.user.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.user.service.MypageService;

@Controller
public class MypageController {
	@Autowired private MypageService service;

	@RequestMapping(value = "/member/mypage/{mem_id}", method = RequestMethod.GET)
	public ModelAndView mypageMain(@PathVariable String mem_id, HttpSession session) {
		HashMap<String, String> parammap=new HashMap<String, String>();
		parammap.put("mem_id", mem_id);
		parammap.put("session_mem_id", (String) session.getAttribute("mem_id"));
		if(parammap.get("session_mem_id")==null) {
			parammap.put("session_mem_id", "");
		}
		HashMap<Object, Object> profilemap=service.profileInfo(parammap);
		ModelAndView mv=new ModelAndView(".member.mypage");
		mv.addObject("mem_tf", acc_member(mem_id, (String) session.getAttribute("mem_id")));
		mv.addObject("profilemap", profilemap);
		return mv;
	}

	@RequestMapping(value = "/member/mypage/{mem_id}/{content}")
	public ModelAndView mypageContent(@PathVariable("mem_id") String mem_id, @PathVariable("content") String content,
			HttpSession session) {
		HashMap<String, String> parammap=new HashMap<String, String>();
		parammap.put("mem_id", mem_id);
		parammap.put("session_mem_id", (String) session.getAttribute("mem_id"));
		HashMap<Object, Object> profilemap=service.profileInfo(parammap);
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

	@RequestMapping(value = "/member/mypage/{mem_id}/follow", method = RequestMethod.POST)
	@ResponseBody
	public int follow(@PathVariable String mem_id, String follow_grade, HttpSession session) {
		String session_mem_id = (String) session.getAttribute("mem_id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("session_mem_id", session_mem_id);
		map.put("follow_grade", follow_grade);
		int n = service.follow(map);
		if (n > 0) {
			n = service.followedcnt(mem_id);
		} else {
			n = -1;
		}
		return n;
	}
	
	public boolean acc_member(String mem_id, String mypagemem_id) {
		if (mem_id.equals(mypagemem_id)) {
			return true;
		} else {
			return false;
		}
	}
}
