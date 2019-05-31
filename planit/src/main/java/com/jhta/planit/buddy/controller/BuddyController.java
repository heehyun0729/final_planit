package com.jhta.planit.buddy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.buddy.service.BuddyService;
import com.jhta.planit.buddy.vo.BuddyCityVo;
import com.jhta.planit.buddy.vo.BuddyCountryVo;
import com.jhta.planit.buddy.vo.BuddyVo;

@Controller
public class BuddyController {
	@Autowired private BuddyService service;
	
	@RequestMapping(value="/buddyList", method=RequestMethod.GET)
	public ModelAndView goBuddyList() {
		
		//체크 박스 동적 생성
		List<String> countryList=service.showCountry();
		HashMap<String, Object>map=new HashMap<String, Object>();
		for(int i=0;i<countryList.size();i++) {
			ArrayList<String> cities=new ArrayList<String>();
			String country=countryList.get(i);
			List<BuddyCityVo> cityList=service.showCity(country);
			if(cityList!=null) {
				for(int j=0;j<cityList.size();j++) {
					cities.add(cityList.get(j).getBuddy_city());
				}
			}
			map.put(country, cities);
		}
		
		//리스트 뽑기
		List<BuddyVo> buddyList=service.showAll();
		
		//검색
//		System.out.println("1 : "+ vo.getBuddy_indate());
//		System.out.println("2 : "+ vo.getBuddy_outdate());
//		System.out.println("3 : "+ countryVo.getBuddy_country());
//		System.out.println("4 : "+ cityVo.getBuddy_city());
//		System.out.println("5 : "+ vo.getBuddy_birthYear());
//		System.out.println("6 : "+ vo.getBuddy_gender());
//		System.out.println("7 : "+ vo.getBuddy_msg());
		
		//뷰 페이지로 이동
		ModelAndView mv=new ModelAndView(".buddy.buddyList");
		mv.addObject("buddyList",buddyList);
		mv.addObject("countryList",countryList);
		mv.addObject("cityList",map);
		return mv;
	}
	
	//글 등록
	@RequestMapping(value="/buddyInsert", method=RequestMethod.GET)
	public String goBuddyInsertForm() {
		return ".buddy.buddyInsert";
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.POST)
	public String buddyInsert(BuddyVo vo,BuddyCountryVo countryVo,BuddyCityVo cityVo) {
		int n=service.buddyInsert(vo,countryVo,cityVo);
		return "redirect:/buddyList";
	}
}
