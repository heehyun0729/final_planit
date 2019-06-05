package com.jhta.planit.room.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.room.vo.RoomVo;

@Repository
public class RoomDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.room.mybatis.RoomMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	public int insert(RoomVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public int getRoomNum() {
		return sqlSession.selectOne(NAMESPACE + ".getRoomNum");
	}
}
