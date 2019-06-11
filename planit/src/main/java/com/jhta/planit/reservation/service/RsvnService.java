package com.jhta.planit.reservation.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservation.dao.RsvnDao;

@Service
public class RsvnService {
	@Autowired private RsvnDao rsvnDao;
	
	public int insert(HashMap<String, Object> map) {
		return rsvnDao.insert(map);
	}
	public int max() {
		return rsvnDao.max();
	}
	public int delete(int num) {
		return rsvnDao.delete(num);
	}
}
