package com.jhta.planit.buddy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuddyDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.user.mybatis.buddyMapper";
}
