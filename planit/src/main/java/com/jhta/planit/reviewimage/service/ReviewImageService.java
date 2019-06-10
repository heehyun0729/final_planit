package com.jhta.planit.reviewimage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.review.dao.ReviewDao;
import com.jhta.planit.review.dao.ReviewImageDao;
import com.jhta.planit.review.vo.ReviewImageVo;


@Service
public class ReviewImageService {
	@Autowired private ReviewDao dao;
		public void setDao(ReviewDao dao) {
			this.dao=dao;
		}
	
	@Autowired private ReviewImageDao imdao;
	public void setDao(ReviewImageDao imdao) {
		this.imdao=imdao;
	}
	
	public int insert(ReviewImageVo vo ) {
		return imdao.insert(vo);
	}
	public ReviewImageVo detail(int review_num) {
			return imdao.detail(review_num);
	}
}
