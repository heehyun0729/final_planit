package com.jhta.planit.review.controller;
//package com.jhta.planit.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//
//
//
//import com.jhta.planit.review.service.ReviewService;
//
//@Controller
//public class ReviewDeleteController {
//	@Autowired private ReviewService service;
//	
//	@RequestMapping(value="/review/reviewDetail")
//	public String delete(int review_num, int reviewImge_num ,Model model) {
//		int n=service.delete(review_num);
//		if(n>0) {
//			//리다이렉트방식으로 페이지 이동하기(컨트롤러호출)
//			return "redirect:/review/reviewDetail.do";
//		}else {
//			model.addAttribute("result","fail");
//			return "result";
//		}
//	}
//	
//	@RequestMapping(value="/review/reviewDetail")
//	
//}
