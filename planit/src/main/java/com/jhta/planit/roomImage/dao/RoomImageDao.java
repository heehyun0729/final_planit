package com.jhta.planit.roomImage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jhta.planit.roomImage.vo.RoomImageVo;

@Repository
public class RoomImageDao {
	private final String NAMESPACE="com.jhta.planit.roomImage.mybatis.RoomImageMapper";
	@Autowired 
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public int insert(RoomImageVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int getRoomImgeNum() {
		return sqlSession.selectOne(NAMESPACE + ".getRoomImgeNum");
	}
}
