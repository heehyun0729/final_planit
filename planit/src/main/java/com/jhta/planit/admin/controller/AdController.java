package com.jhta.planit.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdVo;

@Controller
public class AdController {
	@Autowired
	private AdService service;
	@RequestMapping(value="/adminHome", method=RequestMethod.GET)
	public String adminHome() {
		return ".admin.adminHome";
	}
	@RequestMapping(value="/adminAdRequestInfo", method=RequestMethod.GET)
	public String adminAdRequestInfo() {
		return ".admin.adminAdRequestInfo";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.GET)
	public String adminAdRequestFormGet() {
		return ".admin.adminAdRequestForm";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.POST)
	public String adminAdRequestFormPost(String id, int price, String startDate, String endDate, @RequestParam(value="chance", defaultValue="0")int chance, String company, MultipartFile file, String url) {
		return ".admin.adminAdRequestFormOk";
	}
	@RequestMapping(value="/adminAdGetChance", produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> adminAdGetChance(String startDate, String endDate) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		List<AdVo> list=service.checkPeriod(map);
		int chance=100;
		for(AdVo vo:list) {
			chance-=vo.getAd_chance();
		}
		map.put("chance", chance);
		return map;
	}
}
