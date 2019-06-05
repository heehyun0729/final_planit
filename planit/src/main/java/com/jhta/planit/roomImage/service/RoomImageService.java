package com.jhta.planit.roomImage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jhta.planit.review.vo.ReviewImageVo;
import com.jhta.planit.room.dao.RoomDao;
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

}
