package com.jhta.planit.reservation.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservation.dao.RsvnPayDao;
import com.jhta.planit.reservation.vo.RsvnPayVo;

@Service
public class RsvnPayService {
	@Autowired private RsvnPayDao rsvnPayDao;
	
	public int insert(HashMap<String, Object> map) {
		return rsvnPayDao.insert(map);
	}
	public RsvnPayVo detailByRsvnNum(int rsvn_num) {
		return rsvnPayDao.detailByRsvnNum(rsvn_num);
	}
}
