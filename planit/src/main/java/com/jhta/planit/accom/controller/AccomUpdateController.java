package com.jhta.planit.accom.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.seller.vo.SellerVo;

@Controller
public class AccomUpdateController {
	@Autowired private AccomService service;
	@RequestMapping(value="/accomUpdate",method=RequestMethod.GET)
	public String updateForm(int accom_num,Model model) {
		AccomVo vo=service.detail(accom_num);
		model.addAttribute("vo",vo);
		return ".accom.accomUpdate";
	}
	@RequestMapping(value="adminAccomUpdate",method=RequestMethod.GET)
	public String updateForm1(int accom_num,Model model) {
		AccomVo vo=service.detail(accom_num);
		model.addAttribute("vo",vo);
		return "-accom-admin_accomUpdate";
	}
	@RequestMapping(value="/accomUpdate",method=RequestMethod.POST)
	public String update(int accom_num,String accom_name,String accom_addr,String accom_comm,
			String accom_country,String accom_city,MultipartFile file1,HttpSession session) {

		try {
			if(!file1.isEmpty()) {//첨부된 파일이 있는 경우
				//1. 기존파일 삭제
				String path=session.getServletContext().getRealPath("/resources/uploadAccom");
				AccomVo vo=service.detail(accom_num);
				
				String accommImg_saveImg=vo.getAccommImg_saveImg();
				File f=new File(path +"\\" + accommImg_saveImg);
				if(!f.delete()) {
					new Exception("파일삭제실패!");
				}
				//2. 첨부된 파일 저장
				String accommImg_orgImg=file1.getOriginalFilename();
				accommImg_saveImg = UUID.randomUUID() +"_" + accommImg_orgImg;
				InputStream is=file1.getInputStream();
				FileOutputStream fos=new FileOutputStream(path +"\\" + accommImg_saveImg);
				FileCopyUtils.copy(is,fos);
				is.close();
				fos.close();
				//3. db수정
				AccomVo vo2=new AccomVo(accom_num, 0, accom_name, accom_addr, accom_comm, accom_country, accom_city, accommImg_orgImg, accommImg_saveImg, 0);
				service.update(vo2);
			}else {//첨부된 파일이 없는 경우
				//db수정하기
				AccomVo vo2=new AccomVo(accom_num, 0, accom_name, accom_addr, accom_comm, accom_country, accom_city, null, null, 0);
				service.update(vo2);
			}
			return ".accom.success";
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	@RequestMapping(value="adminAccomUpdate",method=RequestMethod.POST)
	public String update1(int accom_num,String accom_name,String accom_addr,String accom_comm,
			String accom_country,String accom_city,MultipartFile file1,HttpSession session) {

		try {
			if(!file1.isEmpty()) {//첨부된 파일이 있는 경우
				//1. 기존파일 삭제
				String path=session.getServletContext().getRealPath("/resources/uploadAccom");
				AccomVo vo=service.detail(accom_num);
				
				String accommImg_saveImg=vo.getAccommImg_saveImg();
				File f=new File(path +"\\" + accommImg_saveImg);
				if(!f.delete()) {
					new Exception("파일삭제실패!");
				}
				//2. 첨부된 파일 저장
				String accommImg_orgImg=file1.getOriginalFilename();
				accommImg_saveImg = UUID.randomUUID() +"_" + accommImg_orgImg;
				InputStream is=file1.getInputStream();
				FileOutputStream fos=new FileOutputStream(path +"\\" + accommImg_saveImg);
				FileCopyUtils.copy(is,fos);
				is.close();
				fos.close();
				//3. db수정
				AccomVo vo2=new AccomVo(accom_num, 0, accom_name, accom_addr, accom_comm, accom_country, accom_city, accommImg_orgImg, accommImg_saveImg, 0);
				service.update(vo2);
			}else {//첨부된 파일이 없는 경우
				//db수정하기
				AccomVo vo2=new AccomVo(accom_num, 0, accom_name, accom_addr, accom_comm, accom_country, accom_city, null, null, 0);
				service.update(vo2);
			}
			return "-accom-success";
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
}










