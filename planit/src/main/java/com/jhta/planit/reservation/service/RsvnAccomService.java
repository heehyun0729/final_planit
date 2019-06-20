package com.jhta.planit.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservation.dao.RsvnAccomDao;
import com.jhta.planit.reservation.vo.RsvnAccomVo;

@Service
public class RsvnAccomService {
	@Autowired private RsvnAccomDao rsvnAccommDao;
	
	public List<RsvnAccomVo> list(HashMap<String, Object> map){
		return rsvnAccommDao.list(map);
	}
	public int count(HashMap<String, Object> map) {
		return rsvnAccommDao.count(map);
	}

	public int avgStar(int accom_num) {
		return rsvnAccommDao.avgStar(accom_num);
	}
	public int reviewCount(int accom_num) {
		return rsvnAccommDao.reviewCount(accom_num);
	}
}
