package com.jhta.planit.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.planit.qna.service.QnaService;

@Controller
public class QnaDeleteController {
	@Autowired QnaService service;
	
	@RequestMapping("qna/deleteQna")
	public String delete(int qna_num, Model model) {
		int n=service.delete(qna_num);
		if(n>0) {
			return "redirect:/qnaList";
		}else {
			model.addAttribute("result", "fail");
			return "result";
		}
	}
}
