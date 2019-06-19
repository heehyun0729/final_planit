package com.jhta.planit.reservationReview.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;

@Controller
public class ReservationReviewUpdateController {
	@Autowired private ReservationReviewService service;
	 
	
	@RequestMapping(value="/reservationReviewUpdate", method=RequestMethod.GET)
	public String reservationReviewUpdate(int accom_num,int resReview_num, Model model) {
		System.out.println("accom_num1"+ accom_num);
		ReservationReviewVo vo=service.detail(resReview_num);
		model.addAttribute("vo",vo);
		model.addAttribute("accom_num",accom_num);
		return ".reservationReview.reservationReviewUpdate";
	}
	@RequestMapping(value="/resReviewUpdate",method=RequestMethod.POST)
	public String reservationReviewUpdate(int accom_num,int resReview_num,String resReview_title ,String resReview_content,int resReview_star ,HttpSession session) {
		System.out.println("accom_num33"+ accom_num);
		ReservationReviewVo vo =new ReservationReviewVo(resReview_num,null,0,resReview_title,resReview_content,null,resReview_star,0);
		int n=service.resReviewUpdate(vo);
		
			try {
				return "redirect:/reservation/accomDetail?accom_num="+accom_num;
			}catch (Exception e){
				e.printStackTrace();
				return "/reservationReview/fail"; 
			}
	}
}
