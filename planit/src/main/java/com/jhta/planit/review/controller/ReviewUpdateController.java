package com.jhta.planit.review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.review.service.ReviewService;
import com.jhta.planit.review.vo.ReviewImageVo;
import com.jhta.planit.review.vo.ReviewVo;
import com.jhta.planit.reviewimage.service.ReviewImageService;

@Controller
public class ReviewUpdateController {
	@Autowired
	private ReviewService service;
	@Autowired
	private ReviewImageService service2;
	
	@RequestMapping(value="/review/reviewUpdate", method=RequestMethod.GET)
	public String reviewUpdate(int review_num , Model model) {
		System.out.println("review_num:" + review_num);
		ReviewVo vo=service.detail(review_num);
		//ReviewVo vo3=service.detail3(mem_id);
		model.addAttribute("vo",vo);
		return ".review.reviewUpdate";
	}
	
	@RequestMapping(value="/reviewUpdate",method=RequestMethod.POST)
	public String reviewUpdate(int review_num,String review_country, String review_city, String review_title, String review_content, MultipartFile file1, HttpSession session) {
		ReviewVo vo =service.detail(review_num);
		System.out.println("ffff");
			List<ReviewImageVo> vo2 =service2.detail2(review_num);
			System.out.println("weer:" + review_num);
			vo =new ReviewVo(review_num, null, review_country, review_city, review_title, review_content, null, 0, 0, 0);
			System.out.println("ffr:" + review_content);
			if(service.reviewUpdate(vo)>0) {
			try {
				if(!file1.isEmpty()) {
					String path=session.getServletContext().getRealPath("/resources/uploadReview");
					for(int i=0; i<vo2.size();i++) {
						ReviewImageVo vv=vo2.get(i);
					File f= new File(path + "\\" + vv.getReviewImge_saveImg());	
					if(!f.delete()) {
						new Exception("파일삭제실패!");
					}
					}
					//2.첨부된 파일 저장
					String reviewImge_orgImg=file1.getOriginalFilename();
					String reviewImge_saveImg = UUID.randomUUID() + "_" + reviewImge_orgImg;
					InputStream is=file1.getInputStream();
					FileOutputStream fos= new FileOutputStream(path + "\\" + reviewImge_saveImg);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
					//3 db수정
					System.out.println("!@#$!@#$ reviewnum: "+review_num);
					service2.reviewImgDelete(review_num);
					ReviewImageVo vd= new ReviewImageVo(0, review_num, reviewImge_orgImg, reviewImge_saveImg, 0 );
					service2.insert(vd);
				}else{
					
				}
				return "redirect:/review/reviewList";
			}catch (Exception e){
				e.printStackTrace();
				return "/review/fail"; 
			}
		}
			return "redirect:/review/reviewList";
	}
}