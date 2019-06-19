package com.jhta.planit.reservationReview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.reservationReview.dao.ReservationReviewImgDao;
import com.jhta.planit.reservationReview.vo.ReservationReviewImgVo;


@Service
public class ReservationReviewImgService {
	@Autowired private ReservationReviewImgDao imdao;
	public void setDao(ReservationReviewImgDao imdao) {
		this.imdao=imdao;
	}
	public int insert(ReservationReviewImgVo vo ) {
		return imdao.insert(vo);
	}
	public ReservationReviewImgVo detail(int resReview_num) {
			return imdao.detail(resReview_num);
	}
}
