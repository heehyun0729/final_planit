package com.jhta.planit.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.room.vo.RoomVo;

@Repository
public class RsvnRoomDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.reservation.mybatis.RsvnMapper";
	
	public List<RoomVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".roomList", map);
	}
	public RoomVo check(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".roomCheck", map);
	}
}
