package com.jhta.planit.admin.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdImageVo;

@Repository
public class AdImageDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdImageMapper.";
	public int insert(AdImageVo adImageVo) {
		return sqlSession.insert(NAMESPACE + "insert", adImageVo);
	}
	public AdImageVo getAdInfoImage(int adInfo_num) {
		return sqlSession.selectOne(NAMESPACE + "getAdInfoImage", adInfo_num);
	}
}
