/*package com.jhta.planit.accomQna.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accomQna.service.AccomQnaService;
import com.jhta.planit.accomQna.vo.AccomQnaVo;
@Controller
public class AccomQnaController {
	@Autowired private AccomQnaService service;
	@RequestMapping(value="/accomQna",method=RequestMethod.GET)
	public String insert() {
		return ".accomQna.insertAccomQna";
	}
	/*@RequestMapping(value="/accomQna/insertAccomQna", method=RequestMethod.POST)
	public String insert(String mem_id,int accom_num,String accomQna_title,String accomQna_content) {
		ModelAndView mv=new ModelAndView("/accomQna/result");
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("mem_id",mem_id);
		map.put("accom_num",accom_num);
		map.put("accomQna_title",accomQna_title);
		map.put("accomQna_content",accomQna_content);
		service.insert(map);
		return "redirect:/reservation/accomDetail?accom_num=" + accom_num;
		/*int n=service.insert(map);
		System.out.println(map);
		if(n>0) {
			mv.addObject("result","success");
		}else {
			mv.addObject("result","fail");
		}
		return mv;
		
	}
}*/
