package com.jhta.planit.accom.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accom.vo.AccomVo;

@Repository
public class AccomDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.accom.mybatis.AccomMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	public int insert(AccomVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
}
