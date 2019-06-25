package com.jhta.planit.admin.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdInfoVo;
import com.jhta.planit.admin.vo.AdVo;
import com.jhta.planit.reservation.vo.RsvnPayVo;

@Controller
public class AdminAnalysticController {
	@Autowired
	private AdService service;
	
	@RequestMapping(value="/adminAnalytics")//관리자 통계 페이지
	public String adminAnalytics(Model model, HttpSession session) {
		String mem_id=(String)session.getAttribute("mem_id");
		int mem_stat=(Integer)session.getAttribute("mem_stat");
		HashMap<String, Object> map=new HashMap<String, Object>();
		Date getDate=new Date(System.currentTimeMillis());
		String date=getDate.toString();
		map.put("startDate", date);
		map.put("endDate", date);
		
		if(mem_stat==0) {
			List<AdInfoVo> list=service.getChance(map);//금일 광고율, 수익 구하기
			int chance=0;
			for(int a=0;a<list.size();a++) {
				chance+=list.get(a).getAdInfo_chance();
			}
			int adProfit=service.getTodayAdProfit(date);
			map.put("chance", chance);//금일 광고율 담기
			map.put("adProfit", adProfit);//광고 수익 담기
			int roomRate=(int)Math.floor(service.getPaidRoomsRate());//방 예약율 구하기
			map.put("roomRate", roomRate);
			int todaySellProfit=service.todaySellProfit();//금일 예약 수익 구하기
			map.put("todaySellProfit", todaySellProfit);
		}else if(mem_stat==1) {
			int roomRate=(int)Math.floor(service.getPaidRoomsRate(mem_id));//방 예약율 구하기
			map.put("roomRate", roomRate);
			int todaySellerSellProfit=service.todaySellerSellProfit(mem_id);//금일 예약 수익 구하기
			map.put("todaySellProfit", todaySellerSellProfit);
		}
		
		List<Object> getPlanedCountry=service.getPlanedCountry();//플래너 국가 구하기
		ArrayList<String> countryList=new ArrayList<String>();
		ArrayList<BigDecimal> cntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getPlanedCountry.size();i++) {
			HashMap<String, Object> PlanedList=(HashMap<String, Object>)getPlanedCountry.get(i);
			String plandetail_country=(String)PlanedList.get("PLANDETAIL_COUNTRY");
			countryList.add(plandetail_country);
			BigDecimal cntValue=(BigDecimal)PlanedList.get("CNT");
			cntList.add(cntValue);
		}
		map.put("countryList", countryList);//플래너 국가 리스트 담기
		map.put("cntList", cntList);//플래너 국가별 횟수 담기
		
		List<Object> getBuddyCountry=service.getBuddyCountry();//동행 국가 구하기
		ArrayList<String> buddyCountryList=new ArrayList<String>();
		ArrayList<BigDecimal> buddyCntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getBuddyCountry.size();i++) {
			HashMap<String, Object> BuddyList=(HashMap<String, Object>)getBuddyCountry.get(i);
			String buddy_country=(String)BuddyList.get("BUDDY_COUNTRY");
			buddyCountryList.add(buddy_country);
			BigDecimal buddyCntValue=(BigDecimal)BuddyList.get("CNT");
			buddyCntList.add(buddyCntValue);
		}
		map.put("buddyCountryList", buddyCountryList);//동행 국가 리스트 담기
		map.put("buddyCntList", buddyCntList);//동행 국가별 횟수 담기
		
		List<Object> getMembersGender=service.getMembersGender();//회원 성별 구하기
		ArrayList<String> genderList=new ArrayList<String>();
		ArrayList<BigDecimal> genderCntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getMembersGender.size();i++) {
			HashMap<String, Object> memberList=(HashMap<String, Object>)getMembersGender.get(i);
			String mem_gender=(String)memberList.get("MEM_GENDER");
			genderList.add(mem_gender);
			BigDecimal genderCntValue=(BigDecimal)memberList.get("CNT");
			genderCntList.add(genderCntValue);
		}
		map.put("genderList", genderList);
		map.put("genderCntList", genderCntList);
		
		List<Object> getMembersBirthYear=service.getMembersBirthYear();//회원 생일 분포 구하기
		ArrayList<BigDecimal> birthYearList=new ArrayList<BigDecimal>();
		ArrayList<BigDecimal> birthYearCntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getMembersBirthYear.size();i++) {
			HashMap<String, Object> birthList=(HashMap<String, Object>)getMembersBirthYear.get(i);
			BigDecimal mem_birthYear=(BigDecimal)birthList.get("MEM_BIRTHYEAR");
			birthYearList.add(mem_birthYear);
			BigDecimal mem_birthYearCnt=(BigDecimal)birthList.get("CNT");
			birthYearCntList.add(mem_birthYearCnt);
		}
		map.put("birthYearList", birthYearList);
		map.put("birthYearCntList", birthYearCntList);
		
		model.addAttribute("map", map);
		return "-admin-adminBody-adminAnalytics";
	}
	@RequestMapping(value="/adminAnalyticsInfo")//관리자 수익 조회 페이지
	public String adminAnalyticsInfo(Model model, HttpSession session) {
		String mem_id=(String)session.getAttribute("mem_id");
		int mem_stat=(Integer)session.getAttribute("mem_stat");
		HashMap<String, Object> map=new HashMap<String, Object>();
				
		model.addAttribute("map", map);
		return "-admin-adminBody-adminAnalyticsInfo";
	}
	@RequestMapping(value="/adminAnalytics/getDayAdInfo", produces="application/json;charset=utf-8")//일자별 광고 정보 출력
	@ResponseBody
	public String getDayAdInfo(String stringDays) {
		String days[]=stringDays.split(",");
		JSONArray jsonArray=new JSONArray();
		for(int i=0;i<days.length;i++) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("getDayAdHit", service.getDayAdHit(days[i]));
			jsonArray.put(jsonObject);
		}
		for(int i=0;i<days.length;i++) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("getDayAdClick", service.getDayAdClick(days[i]));
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	@RequestMapping(value="/adminAnalytics/profitInfoDownload", produces="application/json;charset=utf-8")//일자별 광고 정보 출력
	public String downloadExcel(Model model, int mem_stat, String stringDays, @RequestParam(value = "stringAdProfit", defaultValue = "")String stringAdProfit, String stringSellProfit, @RequestParam(value = "stringTotalProfit", defaultValue = "")String stringTotalProfit) {
		String[] days=stringDays.split(",");
		String[] adProfit=stringAdProfit.split(",");
		String[] sellProfit=stringSellProfit.split(",");
		String[] totalProfit=stringTotalProfit.split(",");
		model.addAttribute("mem_stat", mem_stat);
		model.addAttribute("days", days);
		model.addAttribute("adProfit", adProfit);
		model.addAttribute("sellProfit", sellProfit);
		model.addAttribute("totalProfit", totalProfit);
        return "ExcelDownloadView";
	}
	
}
