package com.jhta.planit.review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.review.vo.ReviewLikeVo;
import com.jhta.planit.review.vo.ReviewVo;

@Repository
public class ReviewLikeDao {
	private final String NAMESPACE="com.jhta.planit.review.mybatis.ReviewMapper";
	@Autowired private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public int insert(ReviewLikeVo vo) {
		return sqlSession.insert(NAMESPACE + ".insertlike",vo);
	}
	
	public int like(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".review_likeNum",review_num);
	}

	public ReviewVo detail(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail",review_num);
	}
	public ReviewLikeVo likeList(HashMap<String, Object>map) {
		return sqlSession.selectOne(NAMESPACE +".likeList",map);
	}
	public int update(ReviewLikeVo vo) {
		return sqlSession.update(NAMESPACE + ".review_likeNumd",vo);
	}
}

