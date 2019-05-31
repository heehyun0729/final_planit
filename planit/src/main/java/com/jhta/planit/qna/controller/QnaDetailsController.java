package com.jhta.planit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.QnaService;
import com.jhta.planit.qna.vo.QnaVo;

@Controller
public class QnaDetailsController {
	@Autowired QnaService service;
	
	@RequestMapping("/qnaDetails")
	public ModelAndView detail(int qna_num) {
		QnaVo vo=service.detail(qna_num);
		ModelAndView mv=new ModelAndView(".qna.qnaDetails");
		mv.addObject("vo",vo);
		return mv;
	}
}
