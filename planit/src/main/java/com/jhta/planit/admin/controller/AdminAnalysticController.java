package com.jhta.planit.admin.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdInfoVo;
import com.jhta.planit.admin.vo.AdVo;

@Controller
public class AdminAnalysticController {
	@Autowired
	private AdService service;
	
	@RequestMapping(value="/adminAnalytics")//관리자 통계 페이지
	public String adminAnalytics(Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Date getDate=new Date(System.currentTimeMillis());//금일 광고율, 수익 구하기
		String date=getDate.toString();
		map.put("startDate", date);
		map.put("endDate", date);
		List<AdInfoVo> list=service.getChance(map);
		int chance=0;
		for(int a=0;a<list.size();a++) {
			chance+=list.get(a).getAdInfo_chance();
		}
		int adProfit=service.getTodayAdProfit(date);
		List<AdVo> getRecent5Ad=service.getRecent5Ad();
		map.put("chance", chance);//금일 광고율 담기
		map.put("adProfit", adProfit);//광고 수익 담기
		
		List<Object> getPlanedCountry=service.getPlanedCountry();//플래너 국가 구하기
		ArrayList<String> countryList=new ArrayList<String>();
		ArrayList<BigDecimal> cntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getPlanedCountry.size();i++) {
			HashMap<String, Object> PlanedList=(HashMap<String, Object>)getPlanedCountry.get(i);
			String plandetail_country=(String)PlanedList.get("PLANDETAIL_COUNTRY");
			countryList.add(plandetail_country);
			BigDecimal cntValue=(BigDecimal)PlanedList.get("CNT");
			System.out.println("@@"+cntValue);
			cntList.add(cntValue);
		}
		map.put("countryList", countryList);//국가 리스트 담기
		map.put("cntList", cntList);//국가별 횟수 담기
		
		model.addAttribute("map", map);
		return "-admin-adminBody-adminAnalytics";
	}
	
}
