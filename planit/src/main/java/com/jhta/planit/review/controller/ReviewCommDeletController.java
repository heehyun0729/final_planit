package com.jhta.planit.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.review.service.ReviewCommService;

@Controller
public class ReviewCommDeletController {
	@Autowired private ReviewCommService service;
	
	@RequestMapping("/reviewCommDelete")
	@ResponseBody
	public String delete(int review_num,int rcomm_num) {
		System.out.println("eee");
		int n=service.updateCommChk(rcomm_num);
		if(n>0) {
			return "redirect:/review/reviewDetail.do?review_num=" +review_num;
			//return "success";
		}else {
			return "error";
		}
	}
}