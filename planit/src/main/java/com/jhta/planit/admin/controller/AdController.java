package com.jhta.planit.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	public int goWithData(int ad_num, Model model) {//������ ����
		AdVo getAdInfo=service.getAdInfo(ad_num);
		List<AdInfoVo> getAdInfoInfo=service.getAdInfoInfo(ad_num);
		ArrayList<AdImageVo> getAdInfoImage=new ArrayList<AdImageVo>();
		for(int i=0;i<getAdInfoInfo.size();i++) {
			int adInfo_Num=getAdInfoInfo.get(i).getAdInfo_num();
			AdImageVo image=service.getAdInfoImage(adInfo_Num);
			getAdInfoImage.add(image);
		}
		model.addAttribute("getAdInfo", getAdInfo);
		model.addAttribute("getAdInfoInfo", getAdInfoInfo);
		model.addAttribute("getAdInfoImage", getAdInfoImage);
		return 1;
	}
	public int search(int pageNum, String field, String keyword, String ad_progress, Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("ad_progress", ad_progress);
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
		return 1;
	}
	public int adImageSearch(int pageNum, String field, String keyword, String adImg_status, Model model) {//���� �̹��� ���� �Խ��� �˻�
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("adImg_status", adImg_status);
		int totalRowCount=service.getAdImageTotalRowCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("pageNum", pageNum);
		map.put("startPageNum", pu.getStartPageNum());
		map.put("endPageNum", pu.getEndPageNum()); 
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		List<AdImageVo> getAdImageList=service.getAdImageList(map);
		model.addAttribute("getAdImageList", getAdImageList);
		model.addAttribute("map", map);
		return 1;
	}
	public HashMap<String, String> imageUpload(MultipartFile file, HttpSession session) {
		String path=session.getServletContext().getRealPath("/resources/adImage");//���� ���ε�
		//System.out.println("@@@@@@@"+path);//���ε� ���
		String adImg_orgImg=file.getOriginalFilename();
		String adImg_savImg=UUID.randomUUID() + "_" + adImg_orgImg;
		HashMap<String, String> map=new HashMap<String, String>();
		try {
			InputStream in=file.getInputStream();
			FileOutputStream out=new FileOutputStream(path + "/" + adImg_savImg);
			FileCopyUtils.copy(in, out);
			map.put("adImg_orgImg", adImg_orgImg);
			map.put("adImg_savImg", adImg_savImg);
			map.put("path", path);
			in.close();
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	@RequestMapping(value="/adminAdRequestFormOk", method=RequestMethod.GET)///�Ϸ������� �����
	public String adminAdRequestFormGetOk() {
		return ".admin.adminAdRequestFormOk";
	}
	@RequestMapping(value="/adminLogin", method=RequestMethod.GET)//������ �α���
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	@RequestMapping(value="/adminLogout", method=RequestMethod.GET)//������ �α׾ƿ�
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "/admin/adminLogin";
	}
	@RequestMapping(value="/adminHome", method=RequestMethod.GET)//������ Ȩ
	public String adminHome(Model model) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		Date getDate=new Date(System.currentTimeMillis());//���� ������, ���� ���ϱ�
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
		map.put("chance", chance);//���� ������ ���
		map.put("adProfit", adProfit);//���� ���� ���
		
		
		
		model.addAttribute("map", map);
		return "-admin-adminBody-adminHome";
	}
	@RequestMapping(value="/adminAdBadges", produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> adminAdBadges() {//���� ���� �ޱ�
		HashMap<String, Integer> map=service.getAdBadges();
		return map;
	}
	@RequestMapping(value="/adminAdCalendar", method=RequestMethod.GET)//���� �޷�
	public String adminAdCalendar() {
		return "-admin-adminAdManagement-adCalendar";
	}
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST)//������ �α��� -> Ȩ///����߰��ϱ�
	public String adminLoginOk() {
		
		return "redirect:/adminHome";
	}
	@RequestMapping(value="/adminAdRequestInfo", method=RequestMethod.GET)//���� ��û������
	public String adminAdRequestInfo() {
		return ".admin.adminAdRequestInfo";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.GET)//���� ��û ��
	public String adminAdRequestFormGet() {
		return ".admin.adminAdRequestForm";
	}
	@RequestMapping(value="/adminAdRequestForm", method=RequestMethod.POST)//���� ��û �� ����
	public String adminAdRequestFormPost(AdVo vo, String[] order, Date[] orderDate, int[] orderPrice, MultipartFile file, HttpSession session) {
		HashMap<String,String> imageMap=imageUpload(file, session);
		HashMap<String, Object> map=new HashMap<String, Object>();//service���� ���� ������ map�� ���
		String adImg_orgImg=imageMap.get("adImg_orgImg");
		String adImg_savImg=imageMap.get("adImg_savImg");
		String path=imageMap.get("path");
		map.put("adVo", vo);
		map.put("order", order);
		map.put("orderDate", orderDate);
		map.put("orderPrice", orderPrice);
		map.put("file", file);
		map.put("adImg_orgImg", adImg_orgImg);
		map.put("adImg_savImg", adImg_savImg);
		try {
			service.insert(map);//service���� DB���� ����
		}catch(Exception e) {//������ �߻��Ұ�� ���ε� �Ǿ��� ���� ����
			System.out.println(e.getMessage());
			File f=new File(path + "/" + adImg_savImg);
			f.delete();
			System.out.println("���� ���� �Ϸ�");
			return ".error";
		}
		return ".admin.adminAdRequestFormOk";
	}
	@RequestMapping(value="/requestChangeAdImage", method=RequestMethod.GET)//���� �̹��� ���� ��û
	public String adminAdRequestFormPost(int ad_num, int adImg_num, Model model) {
		AdImageVo vo=service.getRequestChangeAdInfoImage(adImg_num);
		model.addAttribute("vo", vo);
		model.addAttribute("ad_num", ad_num);
		model.addAttribute("adImg_num", adImg_num);
		return "/admin/adminAdManagement/requestChangeAdImage";
	}
	@RequestMapping(value="/requestChangeAdImage", method=RequestMethod.POST)//���� �̹��� ���� ��û
	public String adminAdRequestFormPostOk(int ad_num, String adImg_num, MultipartFile file, HttpSession session, Model model) {
		HashMap<String,String> imageMap=imageUpload(file, session);
		HashMap<String,String> map=new HashMap<String, String>();
		map.put("adImg_changeOrgImg", imageMap.get("adImg_orgImg"));
		map.put("adImg_changeSaveImg", imageMap.get("adImg_savImg"));
		map.put("adImg_num", adImg_num);
		try {
			service.requestChangeAdImage(map);
		}catch(Exception e) {//������ �߻��Ұ�� ���ε� �Ǿ��� ���� ����
			System.out.println(e.getMessage());
			File f=new File(imageMap.get("path") + "/" + imageMap.get("adImg_savImg"));
			f.delete();
			System.out.println("���� ���� �Ϸ�");
		}		
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/adAnalytics";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestChangeAdImageInfo")//���� �̹��� ���� ������
	public String requestChangeAdImageInfo(int adImg_num, Model model) {
		AdImageVo vo=service.getRequestChangeAdInfoImage(adImg_num);
		model.addAttribute("vo", vo);
		return "/admin/adminAdManagement/requestChangeAdImageInfo";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestChangeAdImageApprove")//�̹��� ���� ����
	public String adminAdManagementRequestChangeAdImageApprove(String adImg_num) {
		AdImageVo vo=service.getRequestChangeAdInfoImage(Integer.parseInt(adImg_num));
		String adImg_changeOrgImg=vo.getAdImg_changeOrgImg();
		String adImg_changeSaveImg=vo.getAdImg_changeSaveImg();
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("adImg_num", adImg_num);
		map.put("adImg_changeOrgImg", adImg_changeOrgImg);
		map.put("adImg_changeSaveImg", adImg_changeSaveImg);
		service.requestChangeAdImageApprove(map);		
		return "/admin/adminAdManagement/closeModal";	
	}
	@RequestMapping(value="/admin/adminAdManagement/requestChangeAdImageDecline")//�̹��� ���� ����
	public String adminAdManagementRequestChangeAdImageDecline(int adImg_num) {
		service.requestChangeAdImageDecline(adImg_num);
		return "/admin/adminAdManagement/closeModal";
	}
	@RequestMapping(value="/adminAdGetChance", produces="application/json;charset=utf-8")
	@ResponseBody
	public HashMap<String, Object> adminAdGetChance(String todayYear, String todayMonth, int lastDate) {//Ȯ�� �޾ƿ���
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
	@ResponseBody//īī������ ���� Rest API
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
	@RequestMapping(value="/adminAdKakaoPayApproval")//īī������ ���� ��û ����
	public String adminAdKakaoPayApproval() {
		return ".admin.adminAdKakaoPayApproval";
	}
	@RequestMapping(value="/adminAdKakaoPayApprovalOk", produces="application/json;charset=utf-8")//īī������ ���� ����
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
	@RequestMapping(value="/adminAdKakaoPayFail")//īī������ ���� ����
	public String adminAdKakaoPayFail() {
		return ".admin.adminAdKakaoPayFail";
	}
	@RequestMapping(value="/adminAdKakaoPayCancel")//īī������ ���� ���
	public String adminAdKakaoPayCancel() {
		return ".admin.adminAdKakaoPayCancel";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdList")// ���� ��� ���� ����Ʈ
	public String adminAdManagementApprovedAdList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		String ad_progress="0";
		search(pageNum, field, keyword, ad_progress, model);
		return "-admin-adminAdManagement-approvedAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAdList")//ȯ�� ��û ���� ����Ʈ
	public String adminAdManagementRequestRefundAdList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		String ad_progress="3";
		search(pageNum, field, keyword, ad_progress, model);
		return "-admin-adminAdManagement-requestRefundAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestChangeAdImageList")// �̹��� ���� ��û ���� ����Ʈ
	public String adminAdManagementRequestChangeAdImageList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		String adImg_status="1";
		adImageSearch(pageNum, field, keyword, adImg_status, model);
		return "-admin-adminAdManagement-requestChangeAdImageList";
	}
	@RequestMapping(value="/admin/adminAdManagement/allAdList")//��� ���� ����Ʈ
	public String adminAdManagementAllAdList(@RequestParam(value = "pageNum", defaultValue = "1")int pageNum, String field, String keyword, Model model) {
		String ad_progress="-1";
		search(pageNum, field, keyword, ad_progress, model);
		return "-admin-adminAdManagement-allAdList";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdInfo")//���� ��û�� ���� ������
	public String adminAdManagementApprovedAdInfo(int ad_num, Model model) {
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/approvedAdInfo";
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdInfoApprove")//���� ����
	public String adminAdManagementAdInfoApprove(int ad_num) {
		service.approveAd(ad_num);
		return "/admin/adminAdManagement/closeModal";	
	}
	@RequestMapping(value="/admin/adminAdManagement/approvedAdInfoDecline", produces="application/json;charset=utf-8")//���� ���� + ȯ��
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
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAllAdInfo", produces="application/json;charset=utf-8")//���� ��� ȯ��
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
	@RequestMapping(value="/admin/adminAdManagement/adminAdKakaoPayRefund", produces="application/json;charset=utf-8")//īī������ ȯ��
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
	@RequestMapping(value="/requestRefundAllAd")//�ϰ� ȯ�� ��û
	public String requestRefundAllAd(int ad_num, Model model) {
		service.requestRefundAllAd(ad_num);
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/adAnalytics";
	}
	@RequestMapping(value="/requestRefundPartAd")//�κ� ȯ�� ��û
	public String requestRefundAllAd(int ad_num, int adInfo_num, Model model) {
		service.requestRefundPartAd(ad_num, adInfo_num);
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/adAnalytics";
	}
	@RequestMapping(value="/requestDeclineAd")//���� �ߴ�
	public String requestDeclineAd(int ad_num, int adInfo_num, Model model) {
		service.adInfoDeclined(adInfo_num);
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/adAnalytics";
	}
	@RequestMapping(value="/admin/adminAdManagement/requestRefundAdInfo")//ȯ�� ��û�� ���� ������
	public String adminAdManagementRequestRefundAdInfo(int ad_num, Model model) {
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/requestRefundAdInfo";
	}
	@RequestMapping(value="/admin/adminAdManagement/partRefundedAd", produces="application/json;charset=utf-8")//�Ϻ� ȯ�� ad ���̺� ǥ��
	@ResponseBody
	public int partRefundedAd(int ad_num) {
		return service.partRefundedAd(ad_num);
	}
	@RequestMapping(value="/admin/adminAdManagement/allRefundedAd", produces="application/json;charset=utf-8")//�ϰ� ȯ�� ad ���̺� ǥ��
	@ResponseBody
	public int allRefundedAd(int ad_num) {
		return service.allRefundedAd(ad_num);
	}
	@RequestMapping(value="/admin/adminAdManagement/allAdInfo")//All ���� ������
	public String adminAdManagementAllAdInfo(int ad_num, Model model) {
		goWithData(ad_num, model);
		return "/admin/adminAdManagement/allAdInfo";
	}
	
}
