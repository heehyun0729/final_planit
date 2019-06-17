package com.jhta.planit.reservationReview.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservationReview.dao.ReservationReviewLikeDao;
import com.jhta.planit.reservationReview.vo.ReservationReviewLikeVo;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;


@Service
public class ReservationReviewLikeService {
	@Autowired private ReservationReviewLikeDao likedao;
	public void setDao(ReservationReviewLikeDao likedao) {
		this.likedao=likedao;
	}
	
	public int insert(HashMap<String,Object>map) {
		
		return likedao.insert(map);
	}
	
public int like(int resReview_num) {
	return likedao.like(resReview_num);
	}
public ReservationReviewVo detail(int resReview_num) {
	return likedao.detail(resReview_num);
	}
public ReservationReviewLikeVo likeList(HashMap<String,Object>map) {
	return likedao.likeList(map);
	}
public int update(ReservationReviewLikeVo vo) {
	return likedao.update(vo);
	}
}