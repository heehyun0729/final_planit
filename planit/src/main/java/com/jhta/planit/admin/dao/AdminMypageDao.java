package com.jhta.planit.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMypageDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.user.mybatis.mypageMapper";

	public int withdrawal1(String mem_id) {
		return sqlSession.delete(NAMESPACE + ".withdrawal1", mem_id);
	}
	
	public int withdrawal2(String mem_id) {
		return sqlSession.update(NAMESPACE + ".withdrawal2", mem_id);
	}
	
	public int withdrawal3(String mem_id) {
		return sqlSession.update(NAMESPACE + ".withdrawal3", mem_id);
	}
}
