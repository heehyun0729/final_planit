package com.jhta.planit.admin.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdVo;

@Controller
public class AdController {
	@Autowired
	private AdService service;
	@RequestMapping(value="/adminHome", method=RequestMethod.GET)
	public String adminHome() {
		return ".admin.adminHome";
	}
	@RequestMapping(value="/adminAdRequestInfo", method=RequestMethod.GET)
	public String adminAdRequestInfo() {
		return ".admin.adminAdRequestInfo";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.GET)
	public String adminAdRequestFormGet() {
		return ".admin.adminAdRequestForm";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.POST)
	public String adminAdRequestFormPost(AdVo vo, MultipartFile file, HttpSession session) {
		service.insert(vo);//신청정보 DB 저장 @트랜잭션 처리 하기
		String path=session.getServletContext().getRealPath("/resources/adImage");//파일 업로드
		String adImg_orgImg=file.getOriginalFilename();//업로드 파일정보 DB 저장
		String adImg_savImg=UUID.randomUUID() + "_" + adImg_orgImg;
		try {
			InputStream in=file.getInputStream();
			FileOutputStream out=new FileOutputStream(path + "/" + adImg_savImg);
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
			int ad_num=service.getRecentAdNum();
			AdImageVo imgVo=new AdImageVo(0, ad_num, adImg_orgImg, adImg_savImg);
			System.out.println(imgVo);
			service.imgInsert(imgVo);//@트랜잭션 처리 하기
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ".admin.adminAdRequestFormOk";
	}
	@RequestMapping(value="/adminAdGetChance", produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> adminAdGetChance(String ad_startDate, String ad_endDate) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("ad_startDate", ad_startDate);
		map.put("ad_endDate", ad_endDate);
		int peroid=service.getPeriod(map);
		map.put("peroid", peroid);
		List<AdVo> list=service.getChance(map);
		int chance=100;
		for(AdVo vo:list) {
			chance-=vo.getAd_chance();
			System.out.println(vo.getAd_chance());
		}
		System.out.println("chance:" + chance);
		map.put("chance", chance);
		return map;
	}
}
