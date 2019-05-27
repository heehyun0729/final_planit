package com.jhta.planit.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.admin.dao.AdDao;
import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdVo;

@Service
public class AdService {
	@Autowired
	private AdDao dao;
	public int insert(AdVo vo) {
		return dao.insert(vo);
	}
	public int getRecentAdNum() {
		return dao.getRecentAdNum();
	}
	public int imgInsert(AdImageVo vo) {
		return dao.imgInsert(vo);
	}
	public List<AdVo> getChance(HashMap<String, Object> map) {
		return dao.getChance(map);
	}
	public int getPeriod(HashMap<String, Object> map) {
		return dao.getPeriod(map);
	}
}
