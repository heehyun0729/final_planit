package com.jhta.planit.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.plan.service.PlanService;
import com.jhta.planit.plan.vo.PlanVo;
import com.jhta.util.PageUtil;

@Controller
public class AdminPlanController {
	@Autowired PlanService planService;
	
	@RequestMapping("/admin/plan/list")
	public String list(@RequestParam(value="pageNum",defaultValue = "1")int pageNum,
			String field, String keyword, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		int cnt = planService.count(map);
		
		PageUtil pu = new PageUtil(pageNum, cnt, 10, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<PlanVo> list = planService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return "-admin-plan-adminPlanList";
	}
}
