package com.jhta.planit.reservationReview.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;


@Controller
public class ReservationReviewListController {
	@Autowired private ReservationReviewService service;
	@RequestMapping("/reservationReview/reservationReviewList")
	public ModelAndView List() {
		List<ReservationReviewVo> list=service.list(0);
		System.out.println("list11:"+ list);									
		ModelAndView mv=new ModelAndView(".reservation.reservationReviewList");
		mv.addObject("list",list);


		return mv;
	}
}