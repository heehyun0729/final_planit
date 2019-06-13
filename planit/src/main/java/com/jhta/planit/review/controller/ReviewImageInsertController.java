package com.jhta.planit.review.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


import com.jhta.planit.reviewimage.service.ReviewImageService;

@Controller
public class ReviewImageInsertController {
	@Autowired private ReviewImageService service;
	
	 
	 @RequestMapping(value="/review/reviewInsert1",method=RequestMethod.GET)
	 public String reviewInsertForm() {
		 return ".review.reivewInsert";
	 }
		
	 @RequestMapping(value="/reivewInsert1",method=RequestMethod.POST)
	 
	 public String reviewInsert(int reviewImg_num, int review_num, String reviewImg_orgImg, String reviewImg_saveImg, MultipartFile file1,MultipartFile file2,MultipartFile file3, HttpSession session  ) {
		ServletContext application=session.getServletContext();
		String uploadPath=application.getRealPath("/review/reviewInsert");
		System.out.println("45"+uploadPath);
		
		String reviewImg_orgImg1=file1.getOriginalFilename();
		
		String reviewImg_saveImg1=UUID.randomUUID() + "_" + reviewImg_saveImg; //저장파일명
		try {
			InputStream is1=file1.getInputStream();
			FileOutputStream fos1=new FileOutputStream(uploadPath + "\\"+ reviewImg_saveImg);
			FileCopyUtils.copy(is1, fos1);
			is1.close();
			fos1.close();
			System.out.println(uploadPath +"사진 업로드 완료!");
			
		}catch(Exception e){
			System.out.println(e.getMessage());
			return "error";
		}
		return reviewImg_saveImg1;
	 }
}
