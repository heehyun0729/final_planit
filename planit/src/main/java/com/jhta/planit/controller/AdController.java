package com.jhta.planit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdController {
	@RequestMapping(value="/adminHome", method=RequestMethod.GET)
	public String adminHome() {
		return ".admin.adminHome";
	}
	@RequestMapping(value="/adminAdRequestInfo", method=RequestMethod.GET)
	public String adminAdRequestInfo() {
		return ".admin.adminAdRequestInfo";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.GET)
	public String adminAdRequestFormGet() {
		return ".admin.adminAdRequestForm";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.POST)
	public String adminAdRequestFormPost() {
		return ".admin.adminAdRequestFormOk";
	}
	
	
	
}
