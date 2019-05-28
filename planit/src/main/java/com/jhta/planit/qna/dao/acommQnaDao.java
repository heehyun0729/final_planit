package com.jhta.planit.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.qna.vo.AcommQnaVo;

@Repository
public class acommQnaDao {
	@Autowired private SqlSession sqlSession;
	public final String NAMESPACE="com.jhta.planit.mybatis.AcommQnaMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(AcommQnaVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
}
