package com.jhta.planit.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminUserSellerDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.user.mybatis.sellerMapper";

	public int getTotalRowCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".getSellerTotal", map);
	}

	public List<HashMap<String, Object>> getSellerList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getSellerList", map);
	}

	public HashMap<String, Object> getSellerInfo(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".getSellerInfo", mem_id);
	}

	public int approval(String mem_id) {
		return sqlSession.update(NAMESPACE+".approval", mem_id);
	}

	public int returns(String mem_id) {
		return sqlSession.delete(NAMESPACE+".returns", mem_id);
	}

}
