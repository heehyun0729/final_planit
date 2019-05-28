package com.jhta.planit.qna.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaController {
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String QnaMain() {
		return ".qna.qnaMain";
	}
	@RequestMapping(value="/insertQna",method = RequestMethod.GET)
	public String InsertQna() {
		return ".qna.insertQna";
	}
	
}
