package com.jhta.planit.qna.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.QnaService;
import com.jhta.planit.qna.vo.QnaVo;

@Controller
public class QnaListController {
	@Autowired QnaService service;
	
	@RequestMapping("/qnaList")
	public ModelAndView list() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<QnaVo> list=service.list(map);
		ModelAndView mv=new ModelAndView(".qna.qnaList");
		mv.addObject("list", list);
		return mv;
	}
}
