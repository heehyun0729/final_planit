package com.jhta.planit.qna.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.QnaService;
import com.jhta.planit.qna.vo.QnaVo;
import com.jhta.util.PageUtil;

@Controller
public class QnaListController {
	@Autowired QnaService service;
	
	@RequestMapping("/qnaList")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,String field,String keyword) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum,totalRowCount,10,10);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		
		
		List<QnaVo> list=service.list(map);
		ModelAndView mv=new ModelAndView(".qna.qnaList");
		mv.addObject("list", list);
		mv.addObject("pu", pu);
		mv.addObject("field", field);
		mv.addObject("keyword",keyword);
		return mv;
	}
}
