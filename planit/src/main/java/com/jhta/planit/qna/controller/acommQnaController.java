package com.jhta.planit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.acommQnaService;
import com.jhta.planit.qna.vo.AcommQnaVo;
@Controller
public class acommQnaController {
	@Autowired private acommQnaService service;
	@RequestMapping(value="/acommQna",method=RequestMethod.GET)
	public String insert() {
		return ".acommQna.insertAcommQna";
	}
	@RequestMapping(value="/acommQna/insertAcommQna", method=RequestMethod.POST)
	public ModelAndView insert(AcommQnaVo vo) {
		ModelAndView mv=new ModelAndView("/result");
		int n=service.insert(vo);
		if(n>0) {
			mv.addObject("result","success");
		}else {
			mv.addObject("result","fail");
		}
		return mv;
		
	}
}
