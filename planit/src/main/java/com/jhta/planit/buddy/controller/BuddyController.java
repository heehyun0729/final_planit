package com.jhta.planit.buddy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.planit.buddy.service.BuddyService;
import com.jhta.planit.buddy.vo.BuddyVo;

@Controller
public class BuddyController {
	@Autowired private BuddyService service;
	
	@RequestMapping(value="/buddyList", method=RequestMethod.GET)
	public String goBuddyList() {
		return ".buddy.buddyList";
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.GET)
	public String goBuddyInsertForm() {
		return ".buddy.buddyInsert";
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.POST)
	public String buddyInsert(BuddyVo vo) {
		System.out.println("1 : "+ vo.getBuddy_indate());
		return ".buddy.buddyList";
	}
}
