package com.jhta.planit.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.review.service.ReviewService;

@Controller
public class ReviewDeleteController {
	@Autowired private ReviewService service;
	
	@RequestMapping(value="/reviewDelete")
	public String delete(@RequestParam(value="review_num", required=true)int review_num ,Model model) {
		System.out.println("11:"+review_num);
		int n=service.updateReviewChk(review_num);
		if(n>0) {
			//�����̷�Ʈ������� ������ �̵��ϱ�(��Ʈ�ѷ�ȣ��)
			return "redirect:/review/reviewList";
		}else {
			model.addAttribute("result","fail");
			return "result";
		}
	}
}
