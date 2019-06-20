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
		return ".main";
	}
	/*public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			String keyword, String checkin, String checkout, 
			@RequestParam(value = "cnt", defaultValue = "1") int cnt, Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("cnt", cnt);
				
		int rowCnt = rsvnAccomService.count(map);
		PageUtil pu = new PageUtil(pageNum, rowCnt, 8, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<RsvnAccomVo> list = rsvnAccomService.list(map);		
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("keyword", keyword);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("cnt", cnt);
		System.out.println(pu.getStartRow() + ", " + pu.getEndRow());
		return ".reservation.accomList";
	}*/
	
}
