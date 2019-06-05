package com.jhta.planit.seller.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.msgtable.vo.MsgTableVo;
import com.jhta.planit.seller.vo.SellerVo;

@Repository
public class SellerDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.seller.mybatis.SellerMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	public SellerVo find(String mem_id) {
		return sqlSession.selectOne(NAMESPACE+".find",mem_id);
	}
}
