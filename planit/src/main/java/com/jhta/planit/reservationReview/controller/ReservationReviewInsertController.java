package com.jhta.planit.reservationReview.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;

@Controller
public class ReservationReviewInsertController {
	@Autowired private ReservationReviewService service;
	@RequestMapping(value="/reservationReview/reservationReviewDetail", method=RequestMethod.GET)
	public String insert() {
		return ".reservation.accomDetail";
	}
	
	 @RequestMapping(value="/reservationReview/reservationReviewInsert",method=RequestMethod.POST)
	 public String reservationReviewInsert(int resReview_star,String mem_id,String resReview_title,String resReview_content,int rsvn_num, MultipartFile file1, HttpSession session  ) {
		System.out.println("dfdfgd:" + rsvn_num);
		 String path=session.getServletContext().getRealPath("/resources/uploadreservationReview");
		System.out.println("dd:"+mem_id);
		String resReviewImg_orgImg=file1.getOriginalFilename();
		
		String resReviewImg_saveImg=UUID.randomUUID() + "_" + resReviewImg_orgImg;
		try {
			InputStream in=file1.getInputStream();
			FileOutputStream out=new FileOutputStream(path + "/" + resReviewImg_saveImg);
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("rsvn_num", rsvn_num);
		map.put("mem_id",mem_id);
		map.put("resReview_title",resReview_title);
		map.put("resReview_content",resReview_content);
		map.put("resReviewImg_orgImg",resReviewImg_orgImg );
		map.put("resReviewImg_saveImg",resReviewImg_saveImg );
		map.put("resReview_star",resReview_star);
		service.insert(map);
		
		return "/reservationReview/result";
}
}
