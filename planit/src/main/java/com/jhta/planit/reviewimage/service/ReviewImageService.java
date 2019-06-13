package com.jhta.planit.reviewimage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.review.dao.ReviewDao;
import com.jhta.planit.review.dao.ReviewImageDao;
import com.jhta.planit.review.vo.ReviewImageVo;


@Service
public class ReviewImageService {
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
	public int updateImgChk (int reviewImge_num) {
		return imdao.updateImgChk(reviewImge_num);
	}

	public int reviewUpdate(ReviewImageVo vo) {
		return imdao.reviewUpdate(vo);
	}
	public int delete(int review_num) {
		return imdao.delete(review_num);
	}
	public List<ReviewImageVo> detail2(int review_num){
		return imdao.detail2(review_num);
	}

	public int reviewImgDelete(int review_num) {
		return imdao.reviewImgDelete(review_num);
	}
}