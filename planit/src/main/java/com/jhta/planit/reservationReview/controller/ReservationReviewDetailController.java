package com.jhta.planit.reservationReview.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.reservationReview.service.ReservationReviewImgService;

import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.reservationReview.vo.ReservationReviewImgVo;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;

@Controller
public class ReservationReviewDetailController {
	@Autowired private ReservationReviewService service;
	@Autowired private ReservationReviewImgService service2;
	
	@RequestMapping("/reservationReview/reservationReviewDetail.do")
	public ModelAndView reservationReviewDetail(int resReview_num) {
	
	ReservationReviewVo vo=service.detail(resReview_num);
	System.out.println("vo:" + vo);
	String resReview_content=vo.getResReview_content();
	resReview_content=resReview_content.replaceAll("\n", "<br>");
	vo.setResReview_content(resReview_content);
	
	ReservationReviewImgVo vo2=service2.detail(resReview_num);
	
	ReservationReviewVo next=service.next(resReview_num);
	ReservationReviewVo prev=service.prev(resReview_num);
	
	ModelAndView mv=new ModelAndView(".reservationReview.reservationReviewDetail");
	mv.addObject("vo",vo);
	mv.addObject("vo2",vo2);
	mv.addObject("next",next);
	mv.addObject("prev",prev);
	return mv;
	}
}
