package com.jhta.planit.buddy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.planit.buddy.vo.BuddyVo;

@Controller
public class BuddyController {
	@RequestMapping(value="/buddyList", method=RequestMethod.GET)
	public String goBuddyList() {
		return ".buddy.buddyList";
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.GET)
	public String goBuddyInsertForm() {
		return ".buddy.buddyInsert";
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.POST)
	public String BuddyInsert(BuddyVo vo) {
		System.out.println("1:"+vo.getBuddy_gender());
		System.out.println("2:"+vo.getBuddy_country());
		System.out.println("3:"+vo.getBuddy_indate());
		System.out.println("4:"+vo.getBuddy_outdate());
		System.out.println("5:"+vo.getBuddy_msg());
		return ".buddy.buddyList";
	}
}
