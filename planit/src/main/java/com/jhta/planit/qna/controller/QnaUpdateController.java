package com.jhta.planit.qna.controller;

import java.util.HashMap;

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
	public String updateForm(int qna_num,Model model) {
		QnaVo vo=service.getinfo(qna_num);
		model.addAttribute("vo",vo);
		return ".qna.updateQna";
	}
	@RequestMapping(value="/qna/updateQna",method = RequestMethod.POST)
	public ModelAndView update(int qna_num,String qna_title,String qna_content) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("qna_content", qna_content);
		map.put("qna_title",qna_title);
		map.put("qna_num", qna_num);
		
		ModelAndView mv=new ModelAndView("/qna/result");
		int n=service.update(map);
		if(n>0) {
			mv.addObject("result", "success");
		}else {
			mv.addObject("result", "fail");
		}
		return mv;
	}
}
