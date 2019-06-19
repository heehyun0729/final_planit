package com.jhta.planit.room.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.vo.RoomImageVo;

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
	public int count(HashMap<String,Object> map) {
		return sqlSession.selectOne(NAMESPACE +".count",map);
	}
	public List<RoomVo> list(HashMap<String,Object> map){
		return sqlSession.selectList(NAMESPACE+".list",map);
	}
	public RoomVo next(int room_num) {
		return sqlSession.selectOne(NAMESPACE +".next",room_num);
	}
	public RoomVo prev(int room_num) {
		return sqlSession.selectOne(NAMESPACE +".prev",room_num);
	}
	public int updateRoomCheck(int room_num) {
		return sqlSession.update(NAMESPACE+".updateRoomCheck",room_num);
	}
	public int update(RoomVo vo) {
		return sqlSession.update(NAMESPACE +".update",vo);
	}
	public RoomVo detail(int room_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail", room_num);
	}
	public RoomVo detail1(int room_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail1", room_num);
	}
}
