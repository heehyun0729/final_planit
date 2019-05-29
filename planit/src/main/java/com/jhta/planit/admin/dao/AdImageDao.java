package com.jhta.planit.admin.dao;


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
}
