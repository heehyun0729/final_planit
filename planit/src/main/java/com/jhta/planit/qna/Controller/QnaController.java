package com.jhta.planit.qna.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {
	@RequestMapping("/qna")
	public String QnaMain() {
		return ".qna.qnaList";
	}
	
}