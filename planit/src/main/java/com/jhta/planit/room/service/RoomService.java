package com.jhta.planit.room.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jhta.planit.room.dao.RoomDao;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.dao.RoomImageDao;
import com.jhta.planit.roomImage.vo.RoomImageVo;

@Service
public class RoomService {
	@Autowired
	private RoomDao dao;
	public void setDao(RoomDao dao) {
		this.dao = dao;
	}

	@Autowired
	private RoomImageDao imdao;
	public void setDao(RoomImageDao imdao) {
		this.imdao = imdao;
	}

	public int insert(HashMap<String,Object>map) {
		RoomVo vo=(RoomVo)map.get("vo");
		dao.insert(vo);	
		String roomImg_orgImg=(String)map.get("roomImg_orgImg");
		String roomImg_saveImg=(String)map.get("roomImg_saveImg");	
		int room_num=0;
		try {
			room_num=dao.getRoomNum();
		}catch(Exception e){
			System.out.println(e.getMessage());
			room_num=1;
		}		
		RoomImageVo iVo=new RoomImageVo(0, room_num, roomImg_orgImg, roomImg_saveImg);
		System.out.println("iVOOOOOOOOOOO"+iVo);
		imdao.insert(iVo);		
		return room_num;
	}

}
