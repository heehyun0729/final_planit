package com.jhta.planit.roomImage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.review.vo.ReviewImageVo;
import com.jhta.planit.room.dao.RoomDao;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.dao.RoomImageDao;
import com.jhta.planit.roomImage.vo.RoomImageVo;

@Service
public class RoomImageService {
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

	public int insert(RoomImageVo vo) {
		return imdao.insert(vo);
	}

	public List<RoomImageVo> list(int room_num) {
		return imdao.list(room_num);
	}
	public List<RoomImageVo> list1(int room_num) {
		return imdao.list1(room_num);
	}
	public int updateImgCheck(int roomImg_num){
		return imdao.updateImgCheck(roomImg_num);
	}
	public int update(RoomImageVo vo) {
		return imdao.update(vo);
	}
	public List<RoomImageVo> detail(int room_num) {
		return imdao.detail(room_num);
	}
	public int delete(int room_num) {
		return imdao.delete(room_num);
	}
}
