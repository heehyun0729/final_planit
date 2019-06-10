package com.jhta.planit.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.review.dao.ReviewCommDao;
import com.jhta.planit.review.vo.ReviewCommVo;

@Service
public class ReviewCommService {
	@Autowired private ReviewCommDao comdao;
	
	//´ñ±Û Ãß°¡
	public int insert(ReviewCommVo vo) {
		return comdao.insert(vo);
	}
}
