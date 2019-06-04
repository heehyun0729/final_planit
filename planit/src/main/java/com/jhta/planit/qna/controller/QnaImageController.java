package com.jhta.planit.qna.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.qna.service.QnaImageService;
import com.jhta.planit.qna.vo.QnaImageVo;

@Controller
public class QnaImageController {
	@Autowired private QnaImageService service;
	
	@RequestMapping(value="/imgUpload",method=RequestMethod.POST)
	public String imgUpload(int qna_num,String mem_id,String qnaImg_orgImg,String qnaImg_saveImg,MultipartFile file1,HttpSession session) {
		ServletContext application=session.getServletContext();
		String uploadPath=application.getRealPath("/resource/qnaImage");
		String orgfilename=file1.getOriginalFilename();
		String savefilename=UUID.randomUUID() + "_" + orgfilename;
		try {
			InputStream is=file1.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath + "\\" + savefilename);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			QnaImageVo vo=new QnaImageVo(0,qna_num, mem_id, qnaImg_orgImg, qnaImg_saveImg);
			int n=service.insert(vo);
			return "success";
		}catch(IOException ie) {
			System.out.println(ie.getMessage());
			return "error";
		}
		
	}
	
}
