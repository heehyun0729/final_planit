package com.jhta.planit.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.qna.vo.QnaCommVo;

@Repository
public class QnaCommDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.qna.mybatis.QnaCommMapper";
	public int insert(QnaCommVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
}
