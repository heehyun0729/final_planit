package com.jhta.planit.review.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.review.vo.ReviewCommVo;

@Repository
public class ReviewCommDao {
	private final String NAMESPACE="com.jhta.planit.review.mybatis.ReviewCommMapper";
	@Autowired private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	//±Ûµî·Ï
	public int insert(ReviewCommVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
}
