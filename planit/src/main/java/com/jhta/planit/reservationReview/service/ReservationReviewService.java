package com.jhta.planit.reservationReview.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservationReview.dao.ReservationReviewDao;
import com.jhta.planit.reservationReview.dao.ReservationReviewImgDao;
import com.jhta.planit.reservationReview.vo.ReservationReviewImgVo;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;
import com.jhta.planit.review.vo.ReviewVo;

@Service
public class ReservationReviewService {
	@Autowired
	private ReservationReviewDao dao;

	public void setDao(ReservationReviewDao dao) {
		this.dao = dao;
	}

	@Autowired
	private ReservationReviewImgDao imdao;

	public void setDao(ReservationReviewImgDao imdao) {
		this.imdao = imdao;
	}

	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}

	// 댓글 갯수
	public int Count(HashMap<String, Object> map) {
		return dao.count(map);
	}

	// 댓글 목록
	public List<ReservationReviewVo> list(int accom_num) {
		return dao.list(accom_num);
	}

	// 다음글
	public ReservationReviewVo next(int resReview_num) {
		return dao.next(resReview_num);
	}

	// 이전글
	public ReservationReviewVo prev(int resReview_num) {
		return dao.prev(resReview_num);
	}

	// 상세
	public ReservationReviewVo detail(int resReview_num) {
		return dao.detail(resReview_num);
	}

	// 별점
	public ReservationReviewVo resReview_star(int resReview_star) {
		return dao.resReview_star(resReview_star);
	}
	public int updateResReviewChk(int resReview_num) {
		return dao.updateResReviewChk(resReview_num);
	}
	
	public int resReviewUpdate(ReservationReviewVo vo) {
		return dao.resReviewUpdate(vo);
	}
	public List<ReservationReviewVo> reslist(int accom_num){
		return dao.reslist(accom_num);
	}
	public int reviewCnt(int rsvn_num) {
		return dao.reviewCnt(rsvn_num);
	}
}
