package com.jhta.planit.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservation.vo.RsvnAccomVo;

@Repository
public class RsvnAccomDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.reservation.mybatis.RsvnMapper";
	
	public List<RsvnAccomVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".accomList", map);
	}
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".accomCount", map);
	}
	public int avgStar(int accom_num) {
		return sqlSession.selectOne(NAMESPACE + ".avgStar", accom_num);
	}
	public int reviewCount(int accom_num) {
		return sqlSession.selectOne(NAMESPACE + ".reviewCount", accom_num);
	}
}
