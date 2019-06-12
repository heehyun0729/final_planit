package com.jhta.planit.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jhta.planit.admin.service.AdService;

@Controller
public class AdminAnalysticController {
	@Autowired
	private AdService service;
	public String getPlanedCountry() {
		List<Object> getPlanedCountry=service.getPlanedCountry();
		ArrayList<String> country=new ArrayList<String>();
		for(int i=0;i<getPlanedCountry.size();i++) {
			HashMap<String, Object> map=(HashMap<String, Object>)getPlanedCountry.get(i);
			String plandetail_country=(String)map.get("plandetail_country");
			country.add(plandetail_country);
			String cnt=(String)map.get("CNT");
		}
		return "";
	}
}
