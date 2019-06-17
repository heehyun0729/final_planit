package com.jhta.planit.reservationReview.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;

import com.jhta.util.PageUtil;

@Controller
public class ReservationReviewListController {
	@Autowired private ReservationReviewService service;
	@RequestMapping("/reservationReview/reservationReviewList")
	public ModelAndView List(@RequestParam(value="pageNum",defaultValue="1")int pageNum, String field, String keyword) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		
		
		int totalRowCount=service.Count(map);
	
		PageUtil pu=new PageUtil(pageNum,totalRowCount,5,5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		java.util.List<ReservationReviewVo> list=service.list(map);
											
		ModelAndView mv=new ModelAndView(".reservationReview.reservationReviewList");
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		mv.addObject("field",field);
		mv.addObject("keyword",keyword);
		return mv;
	}
}