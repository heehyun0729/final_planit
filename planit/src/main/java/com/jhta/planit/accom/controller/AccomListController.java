package com.jhta.planit.accom.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.seller.vo.SellerVo;
import com.jhta.util.PageUtil;


@Controller
public class AccomListController {
	@Autowired private AccomService service;
	@RequestMapping("/accommList")
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field,String keyword,HttpSession session) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword",keyword);
		map.put("mem_id",session.getAttribute("mem_id"));
		SellerVo vo1 = service.find((String)map.get("mem_id"));
		int sell_num=vo1.getSell_num();
		map.put("sell_num", sell_num);
		//전체 글의갯수
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum,totalRowCount,10, 10);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<AccomVo> list=service.list(map);
		ModelAndView mv=new ModelAndView(".accom.accomList");
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		mv.addObject("field",field);
		mv.addObject("keyword",keyword);
		return mv;
	}
}
















