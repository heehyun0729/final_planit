package com.jhta.planit.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdVo;

@Repository
public class AdDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdMapper.";
	public int insert(AdVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
	public int getRecentAdNum() {
		return sqlSession.selectOne(NAMESPACE + "getRecentAdNum");
	}
	public int imgInsert(AdImageVo vo) {
		return sqlSession.insert(NAMESPACE + "imgInsert", vo);
	}
	public List<AdVo> getChance(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getChance", map);
	}
	public int getPeriod(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + "getPeriod", map);
	}
	
}
