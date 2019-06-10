package com.jhta.planit.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.room.vo.RoomVo;

@Repository
public class RsvnRoomDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.reservation.mybatis.RsvnMapper";
	
	public List<RoomVo> list(int accom_num){
		return sqlSession.selectList(NAMESPACE + ".roomList", accom_num);
	}
}
