package com.jhta.planit.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.review.service.ReviewLikeService;
import com.jhta.planit.review.service.ReviewService;
import com.jhta.planit.review.vo.ReviewImageVo;
import com.jhta.planit.review.vo.ReviewVo;
import com.jhta.planit.reviewimage.service.ReviewImageService;

@Controller
public class ReviewDetailController {
	@Autowired private ReviewService service;
	@Autowired private ReviewImageService service2;
	@Autowired private ReviewLikeService service3;
	
	@RequestMapping("/review/reviewDetail.do")
	public ModelAndView reviewDetail(int review_num,@RequestParam(defaultValue = "1")int hit) {
	if(hit==1) {	
		service.addHit(review_num);//조회수 증가
	}
	ReviewVo vo=service.detail(review_num);
	String review_content=vo.getReview_content();
	review_content=review_content.replaceAll("\n", "<br>");
	vo.setReview_content(review_content);
	 
	int likenum=service3.like(review_num);
	ReviewImageVo vo2=service2.detail(review_num);
	System.out.println("vo2:" + vo2.getReviewImge_saveImg());
	
	ReviewVo next=service.next(review_num);
	ReviewVo prev=service.prev(review_num);
	

	
	ModelAndView mv=new ModelAndView(".review.reviewDetail");
	mv.addObject("vo",vo);
	mv.addObject("vo2",vo2);
	mv.addObject("next",next);
	mv.addObject("prev",prev);
	mv.addObject("review_like",likenum);
	return mv;
	}
}