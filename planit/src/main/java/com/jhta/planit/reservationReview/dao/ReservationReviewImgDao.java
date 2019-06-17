package com.jhta.planit.reservationReview.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservationReview.vo.ReservationReviewImgVo;
import com.jhta.planit.review.vo.ReviewImageVo;

@Repository
public class ReservationReviewImgDao {
	private final String NAMESPACE="com.jhta.planit.reservationReview.mybatis.ReservationReviewImgMapper";
	@Autowired 
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	public int insert(ReservationReviewImgVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int getResReviewImg_num() {
		return sqlSession.selectOne(NAMESPACE + "getresReviewImg_num");
	}
	public ReservationReviewImgVo detail(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail",resReview_num);
	}
	public List<ReservationReviewImgVo> list(){
		return sqlSession.selectList(NAMESPACE +".list"); 
	}
	public ReservationReviewImgVo getinfo(int resReviewImge_num) {
		return sqlSession.selectOne(NAMESPACE + ".getinfo",resReviewImge_num); 
	}
}
