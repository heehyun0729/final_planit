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
	@RequestMapping(value="/adminAdRequestFormOk", method=RequestMethod.GET)///완료페이지 실험용
	public String adminAdRequestFormGetOk() {
		return ".admin.adminAdRequestFormOk";
	}
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)//관리자 로그인
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	@RequestMapping(value="/adminLogout", method=RequestMethod.GET)//관리자 로그아웃
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "/admin/adminLogin";
	}
	@RequestMapping(value="/adminHome", method=RequestMethod.GET)//관리자 홈
	public String adminHome(Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Date getDate=new Date(System.currentTimeMillis());//금일 광고율, 수익 구하기
		String date=getDate.toString();
		map.put("startDate", date);
		map.put("endDate", date);
		List<AdInfoVo> list=service.getChance(map);
		int chance=0;
		int adProfit=0;
		for(int a=0;a<list.size();a++) {
			chance+=list.get(a).getAdInfo_chance();
			adProfit+=list.get(a).getAdInfo_price();
		}
		map.put("chance", chance);//금일 광고율 담기
		map.put("adProfit", adProfit);//광고 수익 담기
		model.addAttribute("map", map);
		return "-admin-adminBody-adminHome";
	}
	@RequestMapping(value="/adminAdBadges", produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> adminAdBadges() {//광고 뱃지 받기
		HashMap<String, Integer> map=service.getAdBadges();
		return map;
	}
	@RequestMapping(value="/adminAdCalendar", method=RequestMethod.GET)//광고 달력
	public String adminAdCalendar() {
		return "-admin-adminAdManagement-adCalendar";
	}
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)//관리자 로그인 -> 홈///기능추가하기
	public String adminLoginOk() {
		
		return "redirect:/adminHome";
	}
	@RequestMapping(value="/adminAdRequestInfo", method=RequestMethod.GET)//광고 신청페이지
	public String adminAdRequestInfo() {
		return ".admin.adminAdRequestInfo";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.GET)//광고 신청 폼
	public String adminAdRequestFormGet() {
		return ".admin.adminAdRequestForm";
	}
	@RequestMapping(value="/adAnalytics", method=RequestMethod.GET)//광고 통계 페이지
	public String adAnalytics(int ad_num, Model model) {
		AdVo getAdInfo=service.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=service.getAdInfoInfo(ad_num);
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		return "/admin/adminAdManagement/adAnalytics";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.POST)//광고 신청 폼 진행
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
	public HashMap<String, Object> adminAdGetChance(String todayYear, String todayMonth, int lastDate) {//확률 받아오기
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
	@ResponseBody//카카오페이 결제 Rest API
	public Object adminAdKakaoPay(String cid, String partner_order_id, String partner_user_id, String item_name, String quantity, String total_amount, String vat_amount, String tax_free_amount, String approval_url, String fail_url, String cancel_url) {
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		String url="https://kapi.kakao.com/v1/payment/ready";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 41e45222d802939978052d57dd29bdad");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
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
	@RequestMapping(value="/adminAdKakaoPayApproval")//카카오페이 결제 요청 성공
	public String adminAdKakaoPayApproval() {
		return ".admin.adminAdKakaoPayApproval";
	}
	@RequestMapping(value="/adminAdKakaoPayApprovalOk", produces="application/json;charset=utf-8")//카카오페이 결제 성공
	@ResponseBody
	public Object adminAdKakaoPayApprovalOk(String cid, String partner_order_id, String partner_user_id, String tid, String pg_token) {
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		String url="https://kapi.kakao.com/v1/payment/approve";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 41e45222d802939978052d57dd29bdad");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("cid", cid);
		map.add("partner_order_id", partner_order_id);
		map.add("partner_user_id", partner_user_id);
		map.add("tid", tid);
		map.add("pg_token", pg_token);
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String,String>>(map,headers);
	    Object obj =  restTemplate.postForObject(url, request, java.util.Map.class);
		return obj;
	}
	@RequestMapping(value="/adminAdKakaoPayFail")//카카오페이 결제 실패
	public String adminAdKakaoPayFail() {
		return ".admin.adminAdKakaoPayFail";
	}
	@RequestMapping(value="/adminAdKakaoPayCancel")//카카오페이 결제 취소
	public String adminAdKakaoPayCancel() {
		return ".admin.adminAdKakaoPayCancel";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdList")// 승인 대기 광고 리스트
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
		return "-admin-adminAdManagement-approvedAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAdList")//환불 요청 광고 리스트
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
		return "-admin-adminAdManagement-requestRefundAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/allAdList")//모든 광고 리스트
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
		return "-admin-adminAdManagement-allAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdInfo")//승인 요청된 광고 상세정보
	public String adminAdManagementApprovedAdInfo(int ad_num, Model model) {
		AdVo getAdInfo=service.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=service.getAdInfoInfo(ad_num);
		int adInfo_Num=getAdInfoInfo.get(0).getAdInfo_num();
		AdImageVo getAdInfoImage=service.getAdInfoImage(adInfo_Num);
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		model.addAttribute("getAdInfoImage", getAdInfoImage);
		return "/admin/adminAdManagement/approvedAdInfo";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdInfoApprove")//광고 승인
	public String adminAdManagementAdInfoApprove(int ad_num) {
		service.approveAd(ad_num);
		return "/admin/adminAdManagement/closeModal";	
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdInfoDecline", produces="application/json;charset=utf-8")//광고 거절 + 환불
	@ResponseBody
	public Object adminAdManagementAdInfoDecline(int ad_num, String ad_tid, String cid, String cancel_amount, String cancel_tax_free_amount) {
		service.declineAd(ad_num);
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		String url="https://kapi.kakao.com/v1/payment/cancel";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 41e45222d802939978052d57dd29bdad");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("cid", cid);
		map.add("tid", ad_tid);
		map.add("cancel_amount", cancel_amount);
		map.add("cancel_tax_free_amount", cancel_tax_free_amount);
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String,String>>(map,headers);
		Object obj =  restTemplate.postForObject(url, request, java.util.Map.class);
		return obj;
	}
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAllAdInfo", produces="application/json;charset=utf-8")//광고 모두 환불
	@ResponseBody
	public Object adminAdManagementRequestRefundAllAdInfo(int ad_num, String ad_tid, String cid, String cancel_amount, String cancel_tax_free_amount) {
		service.refundAllAd(ad_num);
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		String url="https://kapi.kakao.com/v1/payment/cancel";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 41e45222d802939978052d57dd29bdad");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("cid", cid);
		map.add("tid", ad_tid);
		map.add("cancel_amount", cancel_amount);
		map.add("cancel_tax_free_amount", cancel_tax_free_amount);
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String,String>>(map,headers);
		Object obj =  restTemplate.postForObject(url, request, java.util.Map.class);
		return obj;
	}
	@RequestMapping(value="/admin/adminAdManagement/adminAdKakaoPayRefund", produces="application/json;charset=utf-8")//카카오페이 환불
	@ResponseBody
	public Object adminAdKakaoPayRefund(int adInfo_num, String ad_tid, String cid, String cancel_amount, String cancel_tax_free_amount) {
		service.refundedAd(adInfo_num);
		RestTemplate restTemplate = new RestTemplate(new HttpComponentsClientHttpRequestFactory());
		String url="https://kapi.kakao.com/v1/payment/cancel";
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 41e45222d802939978052d57dd29bdad");
		headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
		map.add("cid", cid);
		map.add("tid", ad_tid);
		map.add("cancel_amount", cancel_amount);
		map.add("cancel_tax_free_amount", cancel_tax_free_amount);
		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String,String>>(map,headers);
		Object obj =  restTemplate.postForObject(url, request, java.util.Map.class);
		return obj;
	}
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAdInfo")//환불 요청된 광고 상세정보
	public String adminAdManagementRequestRefundAdInfo(int ad_num, Model model) {
		AdVo getAdInfo=service.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=service.getAdInfoInfo(ad_num);
		int adInfo_Num=getAdInfoInfo.get(0).getAdInfo_num();
		AdImageVo getAdInfoImage=service.getAdInfoImage(adInfo_Num);
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		model.addAttribute("getAdInfoImage", getAdInfoImage);
		return "/admin/adminAdManagement/requestRefundAdInfo";
	}
	@RequestMapping(value="/admin/adminAdManagement/partRefundedAd", produces="application/json;charset=utf-8")//일부 환불 ad 테이블 표시
	@ResponseBody
	public int partRefundedAd(int ad_num) {
		return service.partRefundedAd(ad_num);
	}
	@RequestMapping(value="/admin/adminAdManagement/allRefundedAd", produces="application/json;charset=utf-8")//일부 환불 ad 테이블 표시
	@ResponseBody
	public int allRefundedAd(int ad_num) {
		return service.allRefundedAd(ad_num);
	}
	@RequestMapping(value="/admin/adminAdManagement/allAdInfo")//All 광고 상세정보
	public String adminAdManagementAllAdInfo(int ad_num, Model model) {
		AdVo getAdInfo=service.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=service.getAdInfoInfo(ad_num);
		int adInfo_Num=getAdInfoInfo.get(0).getAdInfo_num();
		AdImageVo getAdInfoImage=service.getAdInfoImage(adInfo_Num);
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		model.addAttribute("getAdInfoImage", getAdInfoImage);
		return "/admin/adminAdManagement/allAdInfo";
	}
	
}
