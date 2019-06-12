package com.jhta.planit.qna.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.qna.service.QnaService;
import com.jhta.planit.qna.vo.QnaVo;
import com.jhta.planit.qnaImg.vo.QnaImageVo;

@Controller
public class QnaController {
	@Autowired private QnaService service;
	public void setService(QnaService service) {
		this.service = service;
	}
	@RequestMapping(value="qna/insertQna",method = RequestMethod.GET)
	public String insertQna() {
		return ".qna.insertQna";
	}
	
	@RequestMapping(value="qna/insertQna",method = RequestMethod.POST)
	public ModelAndView upload(QnaVo vo) {
		ModelAndView mv=new ModelAndView("/qna/result");
		int n=service.insert(vo);
		if(n>0) {
			mv.addObject("result","success");
		}else {
			mv.addObject("result","fail");
		}
		return mv;
		
	}
	/*@RequestMapping(value="qna/insertQna",method = RequestMethod.POST)
	public String imgUpload(String qna_cate,String qna_title,String qna_content,MultipartFile file1,HttpSession session) {
		ServletContext application=session.getServletContext();
		String uploadPath=application.getRealPath("/resource/qnaImage");
		String qnaImg_orgImg=file1.getOriginalFilename();
		String qnaImg_saveImg=UUID.randomUUID() + "_" + qnaImg_orgImg;
		try {
			InputStream is=file1.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath + "\\" + qnaImg_saveImg);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			QnaImageVo vo=new QnaImageVo(0,0,qnaImg_orgImg, qnaImg_saveImg);
		//	service.insert(vo);
			return ".qna.insertQna";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return  "error";
		}
	}*/
}
