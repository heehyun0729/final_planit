package com.jhta.planit.accom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.accomQna.vo.AccomQnaVo;
import com.jhta.planit.seller.vo.SellerVo;
import com.jhta.util.PageUtil;


@Controller
public class AccomDetailController {
	@Autowired private AccomService service;
	@RequestMapping("/accomDetail")
	public ModelAndView list( int accom_num) {
		
		AccomVo vo=service.detail1(accom_num);
		ModelAndView mv=new ModelAndView("-accom-accomDetail");
		mv.addObject("vo",vo);
		return mv;
	}

}
















