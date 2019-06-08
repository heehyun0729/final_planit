package com.jhta.planit.room.dao;

import java.util.List;

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
	public int insert1(RoomVo vo) {
		return sqlSession.insert(NAMESPACE+".insert1",vo);
	}
	public int insert2(RoomVo vo) {
		return sqlSession.insert(NAMESPACE+".insert2",vo);
	}
	public int insert3(RoomVo vo) {
		return sqlSession.insert(NAMESPACE+".insert3",vo);
	}
	public int getRoomNum() {
		return sqlSession.selectOne(NAMESPACE + ".getRoomNum");
	}
	public List<RoomVo> list(int accom_num) {
		return sqlSession.selectList(NAMESPACE+".list",accom_num);
	}
	public int updateRoomCheck(int room_num) {
		return sqlSession.update(NAMESPACE+".updateRoomCheck",room_num);
	}
}
