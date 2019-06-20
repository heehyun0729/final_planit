package com.jhta.planit.home.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.reservation.service.RsvnAccomService;
import com.jhta.planit.reservation.vo.RsvnAccomVo;
import com.jhta.util.PageUtil;


@Controller
public class HomeController {
	@Autowired
	private AdService adService;
	@Autowired private RsvnAccomService rsvnAccomService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		adService.showAd(model);
		
		// 인기 후기 목록
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("popular", "popular");
		int rowCnt = rsvnAccomService.count(map);
		PageUtil pu = new PageUtil(1, rowCnt, 4, 1);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<RsvnAccomVo> alist = rsvnAccomService.list(map);	
		model.addAttribute("alist", alist);
		
		return ".main";
	}
}
