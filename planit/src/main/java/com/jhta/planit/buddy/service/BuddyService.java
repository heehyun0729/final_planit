package com.jhta.planit.buddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.buddy.dao.BuddyDao;
import com.jhta.planit.buddy.vo.BuddyCityVo;
import com.jhta.planit.buddy.vo.BuddyCountryVo;
import com.jhta.planit.buddy.vo.BuddyVo;

@Service
public class BuddyService {
	@Autowired private BuddyDao dao;
	public void setDao(BuddyDao dao) {
		this.dao = dao;
	}
	@Transactional
	public int buddyInsert(BuddyVo vo,BuddyCountryVo countryVo,BuddyCityVo cityVo) {
		String country=countryVo.getBuddy_country();
		String[] countries=country.split(",");
		String city=cityVo.getBuddy_city();
		String[] cities=city.split(",");
		
		//동행DB등록
		int n1=dao.buddyInsert(vo);
		System.out.println("동행등록결과 : "+n1);
		
		//국가도시DB등록
		for(int i=0;i<countries.length;i++) {
			String cr=countries[i];
			String ct=cities[i];
			int n2=dao.buddyCountryInsert(cr);
			int n3=dao.buddyCityInsert(ct);
		}
		return n1;
	}
	
	public List<BuddyVo> showAll(){
		return dao.showAll();
	}
	
	public List<String> showCountry(){
		return dao.showCoutry();
	}
	
	public List<BuddyCityVo> showCity(String country){
		return dao.showCity(country);
	}
	
}
