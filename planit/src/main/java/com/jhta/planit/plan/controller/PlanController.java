package com.jhta.planit.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	@RequestMapping("/plan")
	public String planHome() {
		return ".plan.planner";
	}
}
