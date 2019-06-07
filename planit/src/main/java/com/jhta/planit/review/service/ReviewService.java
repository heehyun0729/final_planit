package com.jhta.planit.review.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.review.dao.ReviewDao;
import com.jhta.planit.review.dao.ReviewImageDao;
import com.jhta.planit.review.vo.ReviewImageVo;
import com.jhta.planit.review.vo.ReviewLikeVo;
import com.jhta.planit.review.vo.ReviewVo;

@Service
public class ReviewService {
	@Autowired private ReviewDao dao;
	public void setDao(ReviewDao dao) {
		this.dao=dao;
	}
	@Autowired
	private ReviewImageDao imdao;
	public void setDao(ReviewImageDao imdao) {
		this.imdao=imdao;
	}
	
		
	//글 등록
	public int insert(HashMap<String,Object>map) {
		ReviewVo vo=(ReviewVo)map.get("vo");
		dao.insert(vo);
		
		String reviewImge_orgImg=(String)map.get("reviewImge_orgImg");
		String reviewImge_saveImg=(String)map.get("reviewImge_saveImg");
	
		int review_num=0;
		try {
			review_num=dao.getReviewNum();
		}catch(Exception e){
			System.out.println(e.getMessage());
			review_num=1;
		}
		
		
		ReviewImageVo imageVo=new ReviewImageVo(0,review_num, reviewImge_orgImg, reviewImge_saveImg);
		
		//dao 주입받는 코드 추가
		//int insert=imdao.insert(vo);
		//ReviewVo dao=new ReviewVo(0,mem_id,review_country, review_title, review_content, sysdate, 0, 0, 0);
		imdao.insert(imageVo);
		
		return review_num;
	}
		

	//댓글 갯수
	public int Count(HashMap<String,Object>map) {
		return dao.count(map);
	}
	//댓글 목록
	public List<ReviewVo> list(HashMap<String,Object>map){
		return dao.list(map);
	}
	//조회수
	public int addHit(int review_num) {
		return dao.addHit(review_num);
	}
	//상세
	public ReviewVo detail(int review_num) {
		return dao.detail(review_num);
	}
	//다음글
	public ReviewVo next(int review_num) {
		return dao.next(review_num);
	}
	//이전글
	public ReviewVo prev(int review_num) {
		return dao.prev(review_num);
	}
	//좋아요
	
	public int like(int review_num) {
		return dao.like(review_num);
	}
	public int like1(int review_num) {
		return dao.like1(review_num);
	}
	
	//삭제
	public int delete(int review_num) {
		return dao.delete(review_num);
	}
}
