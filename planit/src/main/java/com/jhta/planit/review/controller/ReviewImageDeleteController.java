package com.jhta.planit.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.reviewimage.service.ReviewImageService;

@Controller
public class ReviewImageDeleteController {
	@Autowired private ReviewImageService service;
	
	@RequestMapping("/reviewImageDelete")
	public String delete(@RequestParam(value="review_num", required=true)int review_num, @RequestParam(value="reviewImge_num", required=true)int reviewImge_num,Model model) {
		System.out.println("12:"+reviewImge_num);
		int n= service.updateImgChk(reviewImge_num);
		if(n>0) {
			return "redirect:/review/reviewDetail.do?review_num=" +review_num;
		}else{
			model.addAttribute("result","fail");
			return "result";
		}
	}
}
