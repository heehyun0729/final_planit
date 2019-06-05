package com.jhta.planit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.QnaService;
import com.jhta.planit.qna.vo.QnaVo;

@Controller
public class QnaUpdateController {
	@Autowired QnaService service;
	
	@RequestMapping(value="/qna/updateQna",method=RequestMethod.GET)
	public String update(int qna_num,Model model) {
		
		return ".qna.updateQna";
	}
	@RequestMapping(value="/qna/updateQna",method = RequestMethod.POST)
	public ModelAndView update(QnaVo vo) {
		ModelAndView mv=new ModelAndView(".qna.result");
		int n=service.update(vo);
		if(n>0) {
			mv.addObject("result", "success");
		}else {
			mv.addObject("result", "fail");
		}
		return mv;
	}
}
