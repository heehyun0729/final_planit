/*package com.jhta.planit.accomQna.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accomQna.service.AccomQnaService;
import com.jhta.planit.accomQna.vo.AccomQnaVo;

@Controller
public class AccomQnaListController {
	@Autowired AccomQnaService service;

	@RequestMapping("/accomqnaList")
	public ModelAndView list() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<AccomQnaVo> list=service.list(map);
		ModelAndView mv=new ModelAndView(".accomqna.accomqnaList");
		mv.addObject("list", list);
		return mv;
		
	}
}
*/