package com.jhta.planit.reservation.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RsvnPayDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.mybatis.RsvnPayMapper";
	
	public int insert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".insert", map);
	}
}
