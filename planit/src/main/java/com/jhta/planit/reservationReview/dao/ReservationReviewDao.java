package com.jhta.planit.reservationReview.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservationReview.vo.ReservationReviewVo;
import com.jhta.planit.review.vo.ReviewVo;

@Repository
public class ReservationReviewDao {
	private final String NAMESPACE = "com.jhta.planit.reservationReview.mybatis.ReservationReviewMapper";
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// �۵��
	public int insert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".insert", map);
	}

	public int getResReview_num() {
		return sqlSession.selectOne(NAMESPACE + ".getResReview_num");
	}

	// ��۸��
	public List<ReservationReviewVo> list(int accom_num) {
		return sqlSession.selectList(NAMESPACE + ".list",accom_num);
	}

	// ��ȸ��
	public int addHit(int resReview_num) {
		return sqlSession.update(NAMESPACE + ".addHit", resReview_num);
	}

	// �˻�
	public ReservationReviewVo getinfo(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".getinfo", resReview_num);
	}

	// ������
	public ReservationReviewVo next(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".next", resReview_num);
	}

	// ������
	public ReservationReviewVo prev(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".prev", resReview_num);
	}

	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".count", map);
	}

	// ��
	public ReservationReviewVo detail(int resReview_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail", resReview_num);
	}

	public ReservationReviewVo resReview_star(int resReview_star) {
		return sqlSession.selectOne(NAMESPACE + ".detail", resReview_star);
	}
	
	public int reviewCnt(int rsvn_num) {
		return sqlSession.selectOne(NAMESPACE + ".reviewCnt", rsvn_num);
	}

	public int updateResReviewChk(int resReview_num) {
		return sqlSession.update(NAMESPACE +".updateResReviewChk",resReview_num);
	}
	public int resReviewUpdate(ReservationReviewVo vo) {
		return sqlSession.update(NAMESPACE +".resReviewUpdate",vo);
	}
	public List<ReservationReviewVo> reslist(int accom_num) {
		return sqlSession.selectList(NAMESPACE + ".reslist",accom_num);
	}
}
