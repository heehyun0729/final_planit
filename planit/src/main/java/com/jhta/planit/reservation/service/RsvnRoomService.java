package com.jhta.planit.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservation.dao.RsvnRoomDao;
import com.jhta.planit.room.vo.RoomVo;

@Service
public class RsvnRoomService {
	@Autowired private RsvnRoomDao rsvnRoomDao;
	
	public List<RoomVo> list(HashMap<String, Object> map){
		return rsvnRoomDao.list(map);
	}
	public RoomVo check(HashMap<String, Object> map) {
		return rsvnRoomDao.check(map);
	}
}
