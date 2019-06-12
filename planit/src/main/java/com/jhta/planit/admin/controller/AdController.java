package com.jhta.planit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jhta.planit.admin.service.AdService;

@Controller
public class AdController {
	@Autowired
	private AdService service;
	
}
