package com.jhta.planit.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.admin.dao.AdDao;
import com.jhta.planit.admin.vo.AdVo;

@Service
public class AdService {
	@Autowired
	private AdDao dao;
	public int insert(AdVo vo) {
		return dao.insert(vo);
	}
	public List<AdVo> checkPeriod(HashMap<String, Object> map) {
		return dao.checkPeriod(map);
	}
}
