package com.jhta.planit.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.review.service.ReviewLikeService;
import com.jhta.planit.review.service.ReviewService;
import com.jhta.planit.review.vo.ReviewLikeVo;
import com.jhta.planit.review.vo.ReviewVo;

@Controller
public class ReviewLikeController {
	@Autowired private ReviewLikeService service;

//	@RequestMapping(value="/review/reviewLike.do",method=RequestMethod.GET)
//	public String insert() {
//		return "review/reviewDetail";
//	}
	@RequestMapping(value="/review/reviewLike.do", produces="application/xml;charset=utf-8")
	@ResponseBody
	public String reviewDetail(int review_num,String mem_id) {
		System.out.println("MEM_ID:" + mem_id +"," + review_num);
		
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("mem_id", mem_id );
		map.put("review_num", review_num);
		
		/*
		 * select * from like where mem_id ='test12' and review_num=1
		 * if(vo==null)  insert하기
		 * null 이 아니면 1이면 0으로 0이면 1로 update하기
		 * 
		 */
		ReviewLikeVo vo=service.likeList(map);
		//JSONObject json=new JSONObject();
		if(vo==null) {
			ReviewLikeVo vo1=new ReviewLikeVo(0, mem_id, review_num, 1);
			service.insert(vo1);
		}else{
			//업데이트 구문 1이 0으로 변경
			//if문 한번더 1인지 0인지
			ReviewLikeVo vo1=service.likeList(map);
			if(vo1.getReview_like()==1) {
				ReviewLikeVo vo2=new ReviewLikeVo(0, mem_id, review_num, 0);
				System.out.println(vo2);
				service.update(vo2);
			}else if(vo1.getReview_like()==0){
				ReviewLikeVo vo2=new ReviewLikeVo(0, mem_id, review_num, 1);
				System.out.println();
				service.update(vo2);
			}
		}
		//좋아요 수(db와 연동해서)를 xml로 응답
		StringBuffer sb=new StringBuffer();
		sb.append("<?xml version='1.0' encoding='utf-8'?>"); 
		sb.append("<review_like>" + vo.getReview_like() + "</review_like>");//좋아요 수
		System.out.println("xml:" + sb.toString());
		return sb.toString();
	
		
		
		
//		if(vo==null) {
//			ReviewLikeVo vo1=new ReviewLikeVo(0, mem_id, review_num, 1);
//			service.insert(vo1);
//		}else{
//			//업데이트 구문 1이 0으로 변경
//			//if문 한번더 1인지 0인지
//			ReviewLikeVo vo1=service.likeList(map);
//			if(vo1.getReview_like()==1) {
//				ReviewLikeVo vo2=new ReviewLikeVo(0, mem_id, review_num, 0);
//				System.out.println(vo2);
//				service.update(vo2);
//			}else if(vo1.getReview_like()==0){
//				ReviewLikeVo vo2=new ReviewLikeVo(0, mem_id, review_num, 1);
//				System.out.println();
//				service.update(vo2);
//			}
//		}
		
		
		//return "redirect:/review/reviewDetail.do?review_num=" + review_num +"&hit=0";

	}
}