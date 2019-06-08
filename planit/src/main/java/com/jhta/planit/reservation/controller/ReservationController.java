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

import com.jhta.planit.reservation.service.RsvnAccomService;
import com.jhta.planit.reservation.vo.RsvnAccomVo;
import com.jhta.util.PageUtil;

@Controller
public class ReservationController {
	@Autowired private RsvnAccomService accomService; 
	
	@RequestMapping(value="/reservation/list", method=RequestMethod.GET)
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		
		int rowCnt = accomService.count();
		PageUtil pu = new PageUtil(pageNum, rowCnt, 8, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<RsvnAccomVo> list = accomService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		System.out.println(pu.getStartRow() + ", " + pu.getEndRow());
		return ".reservation.rsvnList";
	}
}
