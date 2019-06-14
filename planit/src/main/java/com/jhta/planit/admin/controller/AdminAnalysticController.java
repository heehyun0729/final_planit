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
	
	@RequestMapping(value="/adminAnalytics")//������ ��� ������
	public String adminAnalytics(Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Date getDate=new Date(System.currentTimeMillis());//���� ������, ���� ���ϱ�
		String date=getDate.toString();
		map.put("startDate", date);
		map.put("endDate", date);
		List<AdInfoVo> list=service.getChance(map);
		int chance=0;
		for(int a=0;a<list.size();a++) {
			chance+=list.get(a).getAdInfo_chance();
		}
		int adProfit=service.getTodayAdProfit(date);
		map.put("chance", chance);//���� ������ ���
		map.put("adProfit", adProfit);//���� ���� ���
		
		int roomRate=service.getPaidRoomsRate();//�� ������ ���ϱ�
		map.put("roomRate", (roomRate*100));
		int todaySellProfit=service.todaySellProfit();//���� ���� ���� ���ϱ�
		map.put("todaySellProfit", todaySellProfit);
		
		List<Object> getPlanedCountry=service.getPlanedCountry();//�÷��� ���� ���ϱ�
		ArrayList<String> countryList=new ArrayList<String>();
		ArrayList<BigDecimal> cntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getPlanedCountry.size();i++) {
			HashMap<String, Object> PlanedList=(HashMap<String, Object>)getPlanedCountry.get(i);
			String plandetail_country=(String)PlanedList.get("PLANDETAIL_COUNTRY");
			countryList.add(plandetail_country);
			BigDecimal cntValue=(BigDecimal)PlanedList.get("CNT");
			cntList.add(cntValue);
		}
		map.put("countryList", countryList);//�÷��� ���� ����Ʈ ���
		map.put("cntList", cntList);//�÷��� ������ Ƚ�� ���
		
		List<Object> getBuddyCountry=service.getBuddyCountry();//���� ���� ���ϱ�
		ArrayList<String> buddyCountryList=new ArrayList<String>();
		ArrayList<BigDecimal> buddyCntList=new ArrayList<BigDecimal>();
		for(int i=0;i<getBuddyCountry.size();i++) {
			HashMap<String, Object> BuddyList=(HashMap<String, Object>)getBuddyCountry.get(i);
			String buddy_country=(String)BuddyList.get("BUDDY_COUNTRY");
			buddyCountryList.add(buddy_country);
			BigDecimal buddyCntValue=(BigDecimal)BuddyList.get("CNT");
			buddyCntList.add(buddyCntValue);
		}
		map.put("buddyCountryList", buddyCountryList);//���� ���� ����Ʈ ���
		map.put("buddyCntList", buddyCntList);//���� ������ Ƚ�� ���
		
		List<Object> getMembersGender=service.getMembersGender();//ȸ�� ���� ���ϱ�
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
		
		List<Object> getMembersBirthYear=service.getMembersBirthYear();//ȸ�� ���� ���� ���ϱ�
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
	
}
