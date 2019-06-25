package com.jhta.planit.reservationReview.controller;


import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.reservationReview.service.ReservationReviewService;


@Controller
public class ReservationReviewInsertController {
	@Autowired private ReservationReviewService service;
	@RequestMapping(value="/reservationReview/reservationReviewInsert", method=RequestMethod.GET)
	public String insert(int accom_num) {
		
		return ".reservationReview.reservationReviewInsert";
	}
	
	 @RequestMapping(value="/reservationReview/reservationReviewInsert",method=RequestMethod.POST)
	 public String reservationReviewInsert(@RequestParam(value="accom_num",required=true)int accom_num,int resReview_star,String mem_id,String resReview_title,String resReview_content,int rsvn_num ) {
		System.out.println("dfdfgd:" + rsvn_num);
	
		System.out.println("dd:"+mem_id);
		System.out.println("ssss:"+rsvn_num);
		
		System.out.println("111111111111111");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("rsvn_num", rsvn_num);
		map.put("accom_num", accom_num);
		map.put("mem_id",mem_id);
		map.put("resReview_title",resReview_title);
		map.put("resReview_content",resReview_content);
		map.put("resReview_star",resReview_star);
		service.insert(map);
		
		return "redirect:/reservation/accomDetail?accom_num="+accom_num;
}
}
