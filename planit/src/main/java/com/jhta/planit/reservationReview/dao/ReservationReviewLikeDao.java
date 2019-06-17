package com.jhta.planit.reservationReview.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservationReview.vo.ReservationReviewLikeVo;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;

@Repository
public class ReservationReviewLikeDao {
	private final String NAMESPACE="com.jhta.planit.reservationReview.mybatis.ReservationReviewMapper";
	@Autowired private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public int insert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".insertlike",map);
	}
	
	public int like(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".resreview_likenum",resReview_num);
	}

	public ReservationReviewVo detail(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail",resReview_num);
	}
	public ReservationReviewLikeVo likeList(HashMap<String, Object>map) {
		return sqlSession.selectOne(NAMESPACE +".likeList",map);
	}
	public int update(ReservationReviewLikeVo vo) {
		return sqlSession.update(NAMESPACE + ".resreview_likeNumd",vo);
	}
}
