package com.jhta.planit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.QnaService;
import com.jhta.planit.qna.vo.QnaVo;

@Controller
public class QnaController {
	@Autowired private QnaService service;
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qnaMain() {
		return ".qna.qnaMain";
	}
	@RequestMapping(value="/insertQna",method = RequestMethod.GET)
	public String insertQna() {
		return ".qna.insertQna";
	}
	@RequestMapping(value="/qna/insertQna",method = RequestMethod.POST)
	public ModelAndView insert(QnaVo vo) {
		ModelAndView mv=new ModelAndView("/qna/result");
		int n=service.insert(vo);
		System.out.println("id:" + vo.getMem_id());
		if(n>0) {
			
			mv.addObject("result","success");
		}else {
			mv.addObject("result","fail");
		}
		return mv;
	}
}
