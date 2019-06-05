package com.jhta.planit.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.SellerVo;

@Repository
public class UserSellerDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.user.mybatis.sellerMapper";

	public int sellJoin(SellerVo vo) {
		return sqlSession.insert(NAMESPACE+".sellJoin", vo);
	}
}
