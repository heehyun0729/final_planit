package com.jhta.planit.review.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.review.dao.ReviewDao;
import com.jhta.planit.review.dao.ReviewLikeDao;
import com.jhta.planit.review.vo.ReviewLikeVo;
import com.jhta.planit.review.vo.ReviewVo;

@Service
public class ReviewLikeService {
	@Autowired private ReviewLikeDao likedao;
	public void setDao(ReviewLikeDao likedao) {
		this.likedao=likedao;
	}
	
	public int insert(ReviewLikeVo vo) {
		
		return likedao.insert(vo);
	}
	
public int like(int review_num) {
	return likedao.like(review_num);
	}
public ReviewVo detail(int review_num) {
	return likedao.detail(review_num);
	}
public ReviewLikeVo likeList(HashMap<String,Object>map) {
	return likedao.likeList(map);
	}
public int update(ReviewLikeVo vo) {
	return likedao.update(vo);
	}
}