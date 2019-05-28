package com.jhta.planit.buddy.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.buddy.service.BuddyService;
import com.jhta.planit.buddy.vo.BuddyVo;

@Controller
public class BuddyController {
	@Autowired private BuddyService service;
	
	@RequestMapping(value="/buddyList", method=RequestMethod.GET)
	public ModelAndView goBuddyList() {
		List<String> countryList=service.showCountry();
		HashMap<String, Object>map=new HashMap<String, Object>();
		for(int i=0;i<countryList.size();i++) {
			ArrayList<String> cities=new ArrayList<String>();
			String country=countryList.get(i);
			List<BuddyVo> cityList=service.showCity(country);
			if(cityList!=null) {
				for(int j=0;j<cityList.size();j++) {
					cities.add(cityList.get(j).getBuddy_city());
				}
			}
			map.put(country, cities);
		}
		ModelAndView mv=new ModelAndView(".buddy.buddyList");
		mv.addObject("countryList",countryList);
		mv.addObject("cityList",map);
		return mv;
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.GET)
	public String goBuddyInsertForm() {
		return ".buddy.buddyInsert";
	}
	@RequestMapping(value="/buddyInsert", method=RequestMethod.POST)
	public String buddyInsert(BuddyVo vo) {
		System.out.println("1 : "+ vo.getBuddy_indate());
		System.out.println("2 : "+ vo.getBuddy_outdate());
		System.out.println("3 : "+ vo.getBuddy_country());
		System.out.println("4 : "+ vo.getBuddy_city());
		System.out.println("5 : "+ vo.getBuddy_birthYear());
		System.out.println("6 : "+ vo.getBuddy_gender());
		System.out.println("7 : "+ vo.getBuddy_msg());
		int n=service.insert(vo);
		return "redirect:/buddyList";
	}
}
