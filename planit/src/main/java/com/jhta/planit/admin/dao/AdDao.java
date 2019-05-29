package com.jhta.planit.admin.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdVo;

@Repository
public class AdDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdMapper.";
	public int insert(AdVo adVo) {
		return sqlSession.insert(NAMESPACE + "insert", adVo);
	}
	public int getRecentAdNum() {
		return sqlSession.selectOne(NAMESPACE + "getRecentAdNum");
	}		
}
