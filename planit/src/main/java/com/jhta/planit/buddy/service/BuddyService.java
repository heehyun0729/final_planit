package com.jhta.planit.buddy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.buddy.dao.BuddyDao;
import com.jhta.planit.buddy.vo.BuddyVo;

@Service
public class BuddyService {
	@Autowired private BuddyDao dao;
	public void setDao(BuddyDao dao) {
		this.dao = dao;
	}
	
	public int insert(BuddyVo vo) {
		return dao.insert(vo);
	}
	
	public List<BuddyVo> showCity(String country){
		return dao.showCity(country);
	}
	
	public List<String> showCountry(){
		return dao.showCoutry();
	}
}
