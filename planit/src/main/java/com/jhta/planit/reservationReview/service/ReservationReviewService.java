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
		this.dao=dao;
	}
	@Autowired
	private ReservationReviewImgDao imdao;
	public void setDao(ReservationReviewImgDao imdao) {
		this.imdao=imdao;
	}
	
	public int insert(HashMap<String,Object>map) {
		dao.insert(map);
		
		String resReviewImg_orgImg=(String)map.get("resReviewImg_orgImg");
		String resReviewImg_saveImg=(String)map.get("resReviewImg_saveImg");
	
		int resReview_num=0;
		try {
			resReview_num=dao.getResReview_num();
		}catch(Exception e){
			System.out.println(e.getMessage());
			resReview_num=1;
		}
		
		
		ReservationReviewImgVo imageVo=new ReservationReviewImgVo(0,resReview_num, resReviewImg_orgImg, resReviewImg_saveImg, 0);
	
		imdao.insert(imageVo);
		
		return resReview_num;
	}
	
	//댓글 갯수
		public int Count(HashMap<String,Object>map) {
			return dao.count(map);
		}
		//댓글 목록
		public List<ReservationReviewVo> list(HashMap<String,Object>map){
			return dao.list(map);
		}
		//다음글
		public ReservationReviewVo next(int resReview_num) {
			return dao.next(resReview_num);
		}
		//이전글
		public ReservationReviewVo prev(int resReview_num) {
			return dao.prev(resReview_num);
		}
		//상세
		public ReservationReviewVo detail(int resReview_num) {
			return dao.detail(resReview_num);
		}
		//별점
		public ReservationReviewVo resReview_star(int resReview_star) {
			return dao.resReview_star(resReview_star);
		}
}
