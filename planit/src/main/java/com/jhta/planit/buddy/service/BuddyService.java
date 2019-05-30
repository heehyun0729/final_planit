package com.jhta.planit.buddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.buddy.dao.BuddyDao;
import com.jhta.planit.buddy.vo.BuddyVo;

@Service
public class BuddyService {
	@Autowired private BuddyDao dao;
	public void setDao(BuddyDao dao) {
		this.dao = dao;
	}
	@Transactional
	public int buddyInsert(BuddyVo vo) {
		int n1=dao.buddyInsert(vo);
		System.out.println("동행등록결과 : "+n1);
		int n2=dao.buddyCountryInsert(vo);
		System.out.println("나라등록결과 : "+n2);
		int n3=dao.buddyCityInsert(vo);
		System.out.println("나라등록결과 : "+n3);
		return n1;
	}
	
	public List<BuddyVo> showAll(){
		return dao.showAll();
	}
	
	public List<String> showCountry(){
		return dao.showCoutry();
	}
	
	public List<BuddyVo> showCity(String country){
		return dao.showCity(country);
	}
	
}
