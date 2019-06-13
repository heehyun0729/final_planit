package com.jhta.planit.admin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnalyticsDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AnalyticsMapper.";
	public List<Object> getPlanedCountry(){
		return sqlSession.selectList(NAMESPACE + "getPlanedCountry");
	}
}
