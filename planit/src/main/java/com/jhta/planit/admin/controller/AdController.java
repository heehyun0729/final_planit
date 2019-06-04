package com.jhta.planit.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.planit.admin.service.AdService;
import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdInfoVo;
import com.jhta.planit.admin.vo.AdVo;
import com.jhta.util.PageUtil;

@Controller
public class AdController {
	@Autowired
	private AdService service;
	@RequestMapping(value="/adminAdRequestFormOk", method=RequestMethod.GET)//완료페이지 실험용
	public String adminAdRequestFormGetOk() {
		return ".admin.adminAdRequestFormOk";
	}
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
		String path=session.getServletContext().getRealPath("/resources/adImage");//파일 업로드
		System.out.println(path);//업로드 경로
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
		HashMap<String, Object> map=new HashMap<String, Object>();//service에서 쓰일 정보들 map에 담기
		map.put("adVo", vo);
		map.put("order", order);
		map.put("orderDate", orderDate);
		map.put("orderPrice", orderPrice);
		map.put("file", file);
		map.put("adImg_orgImg", adImg_orgImg);
		map.put("adImg_savImg", adImg_savImg);
		try {
			service.insert(map);//service에서 DB정보 저장
		}catch(Exception e) {//오류가 발생할경우 업로드 되었던 파일 삭제
			System.out.println(e.getMessage());
			File f=new File(path + "/" + adImg_savImg);
			f.delete();
			System.out.println("파일 삭제 완료");
			return ".error";
		}		
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
	@RequestMapping(value="/adminAdKakaoPay", produces="application/json;charset=utf-8")
	@ResponseBody
	public Object adminAdKakaoPay(String cid, String partner_order_id, String partner_user_id, String item_name, String quantity, String total_amount, String vat_amount, String tax_free_amount, String approval_url, String fail_url, String cancel_url) {
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		String url="https://kapi.kakao.com/v1/payment/ready";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 41e45222d802939978052d57dd29bdad");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		org.springframework.util.MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("cid", cid);
		map.add("partner_order_id", partner_order_id);
		map.add("partner_user_id", partner_user_id);
		map.add("item_name", item_name);
		map.add("quantity", quantity);
		map.add("total_amount", total_amount);
		map.add("vat_amount", vat_amount);
		map.add("tax_free_amount", tax_free_amount);
		map.add("approval_url", approval_url);
		map.add("fail_url", fail_url);
		map.add("cancel_url", cancel_url);
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String,String>>(map,headers);
	    Object obj =  restTemplate.postForObject(url, request, java.util.Map.class);
		return obj;
	}
	@RequestMapping(value="/adminAdKakaoPayApproval")
	public String adminAdKakaoPayOk(String tid, Model model) {
		model.addAttribute("ad_tid", tid);
		return ".admin.adminAdKakaoPayApproval";
	}
	@RequestMapping(value="/adminAdKakaoPayFail")
	public String adminAdKakaoPayFail() {
		return ".admin.adminAdKakaoPayFail";
	}
	@RequestMapping(value="/adminAdKakaoPayCancel")
	public String adminAdKakaoPayCancel() {
		return ".admin.adminAdKakaoPayCancel";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdList")
	public String adminAdManagementApprovedAdList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("ad_progress", "0");
		int totalRowCount=service.getTotalRowCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum()); 
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AdVo> getAdList=service.getAdList(map);
		model.addAttribute("getAdList", getAdList);
		model.addAttribute("map", map);
		return ".admin.adminAdManagement.approvedAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAdList")
	public String adminAdManagementRequestRefundAdList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("ad_progress", "3");
		int totalRowCount=service.getTotalRowCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum()); 
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AdVo> getAdList=service.getAdList(map);
		model.addAttribute("getAdList", getAdList);
		model.addAttribute("map", map);
		return ".admin.adminAdManagement.requestRefundAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/allAdList")
	public String adminAdManagementAllAdList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("ad_progress", "-1");
		int totalRowCount=service.getTotalRowCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum()); 
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AdVo> getAdList=service.getAdList(map);
		model.addAttribute("getAdList", getAdList);
		model.addAttribute("map", map);
		return ".admin.adminAdManagement.allAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/adInfo")
	public String adminAdManagementAdInfo(int ad_num, Model model) {
		AdVo getAdInfo=service.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=service.getAdInfoInfo(ad_num);
		int adInfo_Num=getAdInfoInfo.get(0).getAdInfo_num();
		AdImageVo getAdInfoImage=service.getAdInfoImage(adInfo_Num);
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		model.addAttribute("getAdInfoImage", getAdInfoImage);
		return ".admin.adminAdManagement.adInfo";
	}
}
