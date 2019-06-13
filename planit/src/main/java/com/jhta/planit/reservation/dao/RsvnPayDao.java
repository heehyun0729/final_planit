package com.jhta.planit.reservation.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservation.vo.RsvnPayVo;

@Repository
public class RsvnPayDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.mybatis.RsvnPayMapper";
	
	public int insert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".insert", map);
	}
	public RsvnPayVo detailByRsvnNum(int rsvn_num) {
		return sqlSession.selectOne(NAMESPACE + ".detailByRsvnNum", rsvn_num);
	}
	public int cancel(String tid) {
		return sqlSession.update(NAMESPACE + ".cancel", tid);
	}
}
