package com.jhta.planit.review.controller;
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
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.review.service.ReviewService;
import com.jhta.planit.review.vo.ReviewVo;




@Controller
public class ReviewInsertController {
		@Autowired private ReviewService service;
		@RequestMapping(value="/review/reviewInsert", method=RequestMethod.GET)
		public String insert() {
			return ".review.reviewInsert";
		}
//		@RequestMapping(value="/review/reviewInsert",method=RequestMethod.POST)
//		public ModelAndView insertOk(ReviewVo vo) {
//			ModelAndView mv=new ModelAndView("/review/result");
//			System.out.println(vo);
//			int n=service.insert(vo);
//			if(n>0) {
//				mv.addObject("result","success");
//			}else {
//				mv.addObject("result","fail");
//			}
//			return mv;
//		}
//	}
		
		 @RequestMapping(value="/review/reviewInsert",method=RequestMethod.POST)
		 public String reviewInsert(ReviewVo vo, MultipartFile file1, HttpSession session  ) {
			String path=session.getServletContext().getRealPath("/resources/upload");
			System.out.println(path);
			String reviewImg_orgImg=file1.getOriginalFilename();
			//String reviewImg_orgImg2=file2.getOriginalFilename();
			//String reviewImg_orgImg3=file3.getOriginalFilename();
			
			String reviewImg_saveImg=UUID.randomUUID() + "_" + reviewImg_orgImg;
			try {
				InputStream in=file1.getInputStream();
				FileOutputStream out=new FileOutputStream(path + "/" + reviewImg_saveImg);
				FileCopyUtils.copy(in, out);
				in.close();
				out.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("vo", vo);
			map.put("reviewImge_orgImg",reviewImg_orgImg );
			map.put("reviewImge_saveImg",reviewImg_saveImg );
			service.insert(map);
			
			return "/review/result";
	}
}

