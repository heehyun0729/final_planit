package com.jhta.planit.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.plan.service.PlanDetailService;
import com.jhta.planit.plan.service.PlanService;
import com.jhta.planit.plan.vo.PlanDetailVo;
import com.jhta.planit.plan.vo.PlanListVo;
import com.jhta.planit.plan.vo.PlanVo;
import com.jhta.util.PageUtil;

@Controller
public class AdminPlanController {
	@Autowired PlanService planService;
	@Autowired PlanDetailService planDetailService;
	
	@RequestMapping("/admin/plan/delete")
	public String delete(int[] plan_num) {
		boolean ok = true;
		for(int num : plan_num) {
			int n = planDetailService.delete(num);
			if(n > 0) {
				int n1 = planService.delete(num);
				if(n1 < 1) {
					ok = false;
				}
			}else {
				ok = false;
			}
		}
		if(ok == true) {
			return "redirect:/admin/plan/list";
		}else {
			return "-error";
		}
	}
	
	public String formatDate(String date) throws Exception {
		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8, 10);
		date = year + "-" + month + "-" + day;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date d = dateFormat.parse(date);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		String[] week = {"일", "월", "화", "수", "목", "금", "토"};
		String wday = week[calendar.get(Calendar.DAY_OF_WEEK) - 1];
		return year + "년" + month + "월" + day + "일" + "(" + wday + ")";
	}
	
	@RequestMapping(value = "/admin/plan/planInfo", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String detail(String plan_num) throws Exception {
		PlanVo vo = planService.detail(Integer.parseInt(plan_num));
		JSONObject json = new JSONObject();
		json.put("plan_num", vo.getPlan_num());
		json.put("mem_id", vo.getMem_id());
		json.put("plan_title", vo.getPlan_title());
		json.put("plan_startDate", vo.getPlan_startDate());
		json.put("plan_stays", vo.getPlan_stays());
		json.put("plan_img", vo.getPlan_img());
		json.put("plan_public", vo.getPlan_public());
		return json.toString();
	}
	
	@RequestMapping(value = "/admin/plan/planDetailInfo", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getPlanDetail(String plan_num) {
		List<PlanDetailVo> list = planDetailService.list(Integer.parseInt(plan_num));
		JSONArray array = new JSONArray();
		for(PlanDetailVo vo : list) {
			JSONObject json = new JSONObject();
			json.put("num", vo.getPlanDetail_num());
			json.put("order", vo.getPlanDetail_order());
			json.put("country", vo.getPlanDetail_country());
			json.put("city", vo.getPlanDetail_city());
			json.put("lat", vo.getPlanDetail_lat());
			json.put("lng", vo.getPlanDetail_lng());
			json.put("date_in", vo.getPlanDetail_inDate());
			json.put("date_out", vo.getPlanDetail_outDate());
			json.put("stay", vo.getPlanDetail_stay());
			String detail = "-";
			if(vo.getPlanDetail_detail() != null && vo.getPlanDetail_detail() != "") {
				detail = vo.getPlanDetail_detail();
			}
			json.put("detail", detail);
			array.put(json);
		}
		return array.toString();
	}
	
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
		
		List<PlanListVo> list = planService.list(map);
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
