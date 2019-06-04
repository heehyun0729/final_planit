package com.jhta.planit.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdInfoVo;

@Repository
public class AdInfoDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdInfoMapper.";
	public int insert(AdInfoVo adInfoVo) {
		return sqlSession.insert(NAMESPACE + "insert", adInfoVo);
	}
	public int getRecentAdInfoNum() {
		return sqlSession.selectOne(NAMESPACE + "getRecentAdInfoNum");
	}	 
	public List<AdInfoVo> getChance(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getChance", map);
	}
	public List<AdInfoVo> getAdInfoInfo(int ad_num){
		return sqlSession.selectList(NAMESPACE + "getAdInfoInfo", ad_num);
	}
}
