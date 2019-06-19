package com.jhta.planit.reservationReview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.reservationReview.service.ReservationReviewService;

@Controller
public class ReservationReviewDeletController {
	@Autowired private ReservationReviewService service;
	
	@RequestMapping(value="/reservationReviewDelete")
	public String delete(@RequestParam(value="resReview_num", required=true)int resReview_num ,Model model) {
		System.out.println("delete1:" + resReview_num);
		int n=service.updateResReviewChk(resReview_num);
		System.out.println("delete:" +resReview_num);
		if(n>0) {
			return "redirect:/reservation/accomDetail";
		}else {
			model.addAttribute("result","fail");
			return "result";
		}
	}
}
