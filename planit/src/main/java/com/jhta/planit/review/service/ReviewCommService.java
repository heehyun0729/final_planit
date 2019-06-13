package com.jhta.planit.review.service;

import java.util.HashMap;
import java.util.List;

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
	
	// ´ñ±Û °¹¼ö
	public int getCount(int review_num) {
		return comdao.getCount(review_num);
	}
	//´ñ±Û ¸ñ·Ï
	public List<ReviewCommVo> list(HashMap<String,Integer>map){
		return comdao.list(map);
	}
	public int updateCommChk(int rcomm_num) {
		return comdao.updateCommChk(rcomm_num);
	}
}
