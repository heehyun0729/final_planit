package com.jhta.planit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.planit.qna.service.QnaService;

/*@Controller
public class AdminQnAController {
	@Autowired QnaService qnaservice;
	@RequestMapping("/admin/qna/delete")
	public String delete(int[] qna_num) {
		boolean ok = true;
		for(int num : qna_num) {
			int n = qnaservice.delete(qna_num);
			if(n > 0) {
				int n1 = qnaservice.delete(qna_num);
				if(n1 < 1) {
					ok = false;
				}
			}else {
				ok = false;
			}
		}
		if(ok == true) {
			return "redirect:/admin/adminQnaList";
		}else {
			return "-error";
		}
	}
}*/
