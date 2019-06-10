package com.jhta.planit.review.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.review.service.ReviewCommService;
import com.jhta.planit.review.vo.ReviewCommVo;

@Controller
public class ReviewCommInsertController {
	@Autowired private ReviewCommService service;
	
	//´ñ±Ûµî·Ï
	@RequestMapping (value="/review/reviewComm.do",produces= "application/xml;charset=utf-8")
	@ResponseBody
	public String insert(ReviewCommVo vo,int review_num,String mem_id,HttpSession session) {
		
		service.insert(vo);
		
		//xml´ä
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>"); 
		sb.append("<rcomm_num>" + vo.getRcomm_num() + "</rcomm_num>");
		System.out.println("xml:" + sb.toString());
		return sb.toString();
	}
	
	//@RequestMapping(value="", method=RequestMethod.POST)
	
}
