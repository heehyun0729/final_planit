package com.jhta.planit.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservation.dao.RsvnDao;
import com.jhta.planit.reservation.vo.MyRsvnVo;
import com.jhta.planit.reservation.vo.RsvnVo;
import com.jhta.planit.reservation.vo.SellerRsvnVo;

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
	public List<MyRsvnVo> myList(HashMap<String, Object> map){
		return rsvnDao.myList(map);
	}
	public int myCount(String mem_id) {
		return rsvnDao.myCount(mem_id);
	}
	public RsvnVo detail(int num) {
		return rsvnDao.detail(num);
	}
	public List<SellerRsvnVo> sellList(HashMap<String, Object> map){
		return rsvnDao.sellList(map);
	}
	public int sellCount(HashMap<String, Object> map) {
		return rsvnDao.sellCount(map);
	}
}
