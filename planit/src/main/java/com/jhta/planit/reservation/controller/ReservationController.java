package com.jhta.planit.reservation.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.util.PageUtil;

@Controller
public class ReservationController {
	@Autowired private AccomService accomService;
	
	@RequestMapping(value="/reservation/list", method=RequestMethod.GET)
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		
		int rowCnt = accomService.count(map);
		PageUtil pu = new PageUtil(pageNum, rowCnt, 8, 5);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AccomVo> list=accomService.list(map);
		
		model.addAttribute("list", list);
		model.addAttribute("rowCnt", rowCnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", pu.getStartRow());
		model.addAttribute("endRow", pu.getEndRow());
		return ".reservation.rsvnList";
	}
}
