package com.jhta.planit.admin.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdInfoVo;
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
	public String adminAdRequestFormPost(AdVo vo, String[] order, Date[] orderDate, int[] orderPrice, MultipartFile file, HttpSession session) {
		int ad_num=service.getRecentAdNum();
		String path=session.getServletContext().getRealPath("/resources/adImage");//파일 업로드
		System.out.println(path);
		String adImg_orgImg=file.getOriginalFilename();
		String adImg_savImg=UUID.randomUUID() + "_" + adImg_orgImg;
		try {
			InputStream in=file.getInputStream();
			FileOutputStream out=new FileOutputStream(path + "/" + adImg_savImg);
			FileCopyUtils.copy(in, out);
			in.close();
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		
		AdImageVo adImageVo=new AdImageVo(0, ad_num, adImg_orgImg, adImg_savImg);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("adVo", vo);
		map.put("order", order);
		map.put("orderDate", orderDate);
		map.put("orderPrice", orderPrice);
		map.put("file", file);
		map.put("ad_num", ad_num);
		map.put("adImageVo", adImageVo);
		boolean success=service.insert(map);//service에서 DB정보 저장--> 리턴값이 에러일경우 파일삭제 코드 추가하기
		return ".admin.adminAdRequestFormOk";
	}
	@RequestMapping(value="/adminAdGetChance", produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> adminAdGetChance(String todayYear, String todayMonth, int lastDate) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		String startDate=todayYear+"-"+todayMonth+"-1";
		String endDate=todayYear+"-"+todayMonth+"-"+lastDate;
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		List<AdInfoVo> list=service.getChance(map);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-M-d"); 
		for(int i=1;i<=lastDate;i++) {
			int chance=0;
			for(int a=0;a<list.size();a++) {
				String date = formatter.format(list.get(a).getAdInfo_date());
				if(date.toString().equals(todayYear+"-"+todayMonth+"-"+i)) {
					chance+=list.get(a).getAdInfo_chance();
				}
			}
			map.put("chance"+i, chance);
		}		
		return map;
	}
}
