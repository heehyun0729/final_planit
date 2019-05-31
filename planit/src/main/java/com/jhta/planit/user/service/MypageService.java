package com.jhta.planit.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.user.dao.MypageDao;

@Service
public class MypageService {
	@Autowired private MypageDao dao;

	public HashMap<Object, Object> profileInfo(String mem_id) {
		return dao.profileInfo(mem_id);
	}
}
