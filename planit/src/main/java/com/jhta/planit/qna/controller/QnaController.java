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
public class QnaController {
	@Autowired private QnaService service;
	public void setService(QnaService service) {
		this.service = service;
	}
	@RequestMapping(value="qna/insertQna",method = RequestMethod.GET)
	public String insertQna() {
		return ".qna.insertQna";
	}
	@RequestMapping(value="qna/insertQna",method = RequestMethod.POST)
	public String upload(QnaVo vo,Model model) {
		service.insert(vo);
		model.addAttribute("vo", vo);
		return "redirect:../qnaList";
	}
}
