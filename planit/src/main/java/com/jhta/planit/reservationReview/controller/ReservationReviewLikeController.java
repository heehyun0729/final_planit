package com.jhta.planit.reservationReview.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.reservationReview.service.ReservationReviewLikeService;
import com.jhta.planit.reservationReview.vo.ReservationReviewLikeVo;
import com.jhta.planit.review.service.ReviewLikeService;
import com.jhta.planit.review.vo.ReviewLikeVo;

//@Controller
//public class ReservationReviewLikeController {
//	@Autowired private ReservationReviewLikeService service;
//	@RequestMapping(value="/reservationReview/reservationReviewLike.do", produces="application/xml;charset=utf-8")
//	@ResponseBody
//	public String reviewDetail(int resReview_num,String mem_id) {
//		System.out.println("MEM_ID:" + mem_id +"," + resReview_num);
//		
//		HashMap<String,Object> map=new HashMap<String, Object>();
//		map.put("mem_id", mem_id );
//		map.put("review_num", resReview_num);
//	
//		ReservationReviewLikeVo vo=service.likeList(map);
//		if(vo==null) {
//			ReservationReviewLikeVo vo1=new ReservationReviewLikeVo(0, mem_id, resReview_num, 1);
//			service.insert(vo1);
//		}else{
//			//업데이트 구문 1이 0으로 변경
//			//if문 한번더 1인지 0인지
//			ReservationReviewLikeVo vo1=service.likeList(map);
//			if(vo1.getResreview_like()==1) {
//				ReservationReviewLikeVo vo2=new ReservationReviewLikeVo(0, mem_id, resReview_num, 0);
//				System.out.println(vo2);
//				service.update(vo2);
//			}else if(vo1.getResreview_like()==0){
//				ReservationReviewLikeVo vo2=new ReservationReviewLikeVo(0, mem_id, resReview_num, 1);
//				System.out.println();
//				service.update(vo2);
//			}
//		}
//		//좋아요 수(db와 연동해서)를 xml로 응답
//		StringBuffer sb=new StringBuffer();
//		sb.append("<?xml version='1.0' encoding='utf-8'?>"); 
//		sb.append("<resreview_like>" + vo.getResreview_like() + "</resreview_like>");//좋아요 수
//		System.out.println("xml:" + sb.toString());
//		return sb.toString();
//	}
//}