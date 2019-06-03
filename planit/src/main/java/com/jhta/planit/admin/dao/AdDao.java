package com.jhta.planit.admin.dao;


import java.util.HashMap;
import java.util.List;

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
	public int getTotalRowCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + "getTotalRowCount", map);
	}
	public List<AdVo> getAdList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getAdList", map);
	}
}
