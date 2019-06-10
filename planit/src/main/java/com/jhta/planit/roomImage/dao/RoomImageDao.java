package com.jhta.planit.roomImage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accom.vo.AccomVo;
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
	public List<RoomImageVo> list(int room_num) {
		return sqlSession.selectList(NAMESPACE + ".list",room_num);
	}
	public int updateImgCheck(int roomImg_num) {
		return sqlSession.update(NAMESPACE+".updateImgCheck",roomImg_num);
	}
	public int update(RoomImageVo vo) {
		return sqlSession.update(NAMESPACE +".update",vo);
	}
}
