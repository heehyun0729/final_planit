package com.jhta.planit.reservation.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.reservation.service.RsvnAccomService;
import com.jhta.planit.reservation.service.RsvnPayService;
import com.jhta.planit.reservation.service.RsvnRoomService;
import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.reservation.vo.RsvnAccomVo;
import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.service.RoomImageService;
import com.jhta.planit.roomImage.vo.RoomImageVo;
import com.jhta.planit.user.service.MembersService;
import com.jhta.planit.user.vo.MembersVo;
import com.jhta.util.PageUtil;

@Controller
public class RsvnController {
	@Autowired private RsvnAccomService rsvnAccomService;
	@Autowired private AccomService accomService;
	@Autowired private RoomService roomService;
	@Autowired private RsvnRoomService rsvnRoomService;
	@Autowired private RoomImageService roomImageService;
	@Autowired private RsvnService rsvnService;
	@Autowired private RsvnPayService rsvnPayService;
	@Autowired private MembersService membersService;
	
	@RequestMapping("/reservation/insert")
	public String insert(int room_num, String checkin, String checkout, int cnt, 
			String name, String email, String phone, String tid, int total, HttpSession session) {
		int num = rsvnService.max() + 1;
		String mem_id = (String)session.getAttribute("mem_id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("mem_id", mem_id);
		map.put("room_num", room_num);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("cnt", cnt);
		map.put("name", name);
		map.put("email", email);
		map.put("phone", phone);
		map.put("tid", tid);
		map.put("total", total);
		int n = rsvnService.insert(map);
		if(n > 0) {
			int n1 = rsvnPayService.insert(map);
			if(n1 > 0) {
				// 마이페이지 예약내역
				return "redirect:/member/mypage/" + mem_id + "/book";
			}else {
				return ".error";
			}
		}else {
			rsvnService.delete(num);
			return ".error";
		}
	}
	
	@RequestMapping(value = "/reservation/payApprovalOk", produces="application/json;charset=utf-8")
	@ResponseBody
	public Object payApprovalOk(String tid, String pg_token) {
		RestTemplate restTemplate = new RestTemplate();
		String host = "https://kapi.kakao.com/v1/payment/approve";
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 701d2fb4d9d20c3624d31b24e8e0caab");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "partner_order_id");
        params.add("partner_user_id", "partner_user_id");
        params.add("tid", tid);
        params.add("pg_token", pg_token);
        
        System.out.println(tid + "///" + pg_token);
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        Object object = restTemplate.postForObject(host, body, Map.class);        
        return object;
	}
	
	@RequestMapping(value = "/reservation/pay", produces="application/json;charset=utf-8")
	@ResponseBody
	public Object pay(String item_name, String total_amount) {
		RestTemplate restTemplate = new RestTemplate();
		String host = "https://kapi.kakao.com/v1/payment/ready";
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 701d2fb4d9d20c3624d31b24e8e0caab");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "partner_order_id");
        params.add("partner_user_id", "partner_user_id");
        params.add("item_name", item_name);
        params.add("quantity", "1");
        params.add("total_amount", total_amount);
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://localhost:9090/planit/reservation/payApproval");
        params.add("cancel_url", "http://localhost:9090/planit/reservation/payCancel");
        params.add("fail_url", "http://localhost:9090/planit/reservation/payFail");
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        Object object = restTemplate.postForObject(host, body, Map.class);        
        return object;
	}
	
	@RequestMapping("/reservation/payApproval")
	public String payApproval() {
		return "/reservation/payApproval";
	}
	
	@RequestMapping("/reservation/payCancel")
	public String payCancel() {
		return "/reservation/payCancel";
	}
	
	@RequestMapping("/reservation/payFail")
	public String payFail() {
		return "/reservation/payFail";
	}
	
	@RequestMapping("/reservation/book")
	public String goBook(int accom_num, int room_num, String checkin, String checkout, int cnt, int stay, 
			Model model, HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
		MembersVo mvo = membersService.idCheck(mem_id);
		AccomVo avo = accomService.detail(accom_num);
		RoomVo rvo = roomService.detail(room_num);
		rvo.setRoom_images(roomImageService.list(room_num));
		
		model.addAttribute("mvo", mvo);
		model.addAttribute("avo", avo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("cnt", cnt);
		model.addAttribute("stay", stay);
		return ".reservation.rsvnBook";
	}
	
	public String getApi() throws IOException {
		FileReader fr = null;
		String key = "";
		try {
			fr = new FileReader(new File("C:\\Users\\JHTA\\git\\repository\\planit\\src\\main\\webapp\\resources\\apiKey.txt"));
			while(true) {
				int n = fr.read();
				if(n == -1) break;
				key += (char)n;
			}
		}catch(FileNotFoundException fe){
			fe.printStackTrace();
		}finally {
			fr.close();
		}
		return key;
	}
	
	@RequestMapping(value = "/reservation/roomDetail")
	@ResponseBody
	public RoomVo roomDetail(int room_num) {
		RoomVo vo = roomService.detail(room_num);
		vo.setRoom_images(roomImageService.list(room_num));
		return vo;
	}
	
	@RequestMapping(value = "/reservation/roomCheck")
	@ResponseBody
	public RoomVo check(int room_num, String checkin, String checkout, int cnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("room_num", room_num);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("cnt", cnt);
		RoomVo vo = rsvnRoomService.check(map);
		if(vo == null) {
			vo = new RoomVo();
			vo.setRoom_num(-1);
		}
		return vo;
	}
	
	@RequestMapping("/reservation/detail")
	public String detail(int accom_num, String checkin, String checkout, 
			@RequestParam(value = "cnt", defaultValue = "1") int cnt, Model model, HttpSession session) throws IOException {
		String key = getApi();
		session.setAttribute("key", key);
		
		AccomVo avo = accomService.detail(accom_num);
		String str = avo.getAccom_comm().replaceAll("\n", "<br>");
		avo.setAccom_comm(str);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("accom_num", accom_num);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("cnt", cnt);
				
		List<RoomVo> rlist = rsvnRoomService.list(map);
		for(RoomVo vo : rlist) {
			String str1 = vo.getRoom_comm().replaceAll("\n", "<br>");
			vo.setRoom_comm(str1);
			List<RoomImageVo> ilist = roomImageService.list(vo.getRoom_num());
			vo.setRoom_images(ilist);
		} 
		model.addAttribute("avo", avo);
		model.addAttribute("rlist", rlist);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("cnt", cnt);
		return ".reservation.rsvnDetail";
	}
	
	@RequestMapping("/reservation/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
			String keyword, String checkin, String checkout, 
			@RequestParam(value = "cnt", defaultValue = "1") int cnt, Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("cnt", cnt);
				
		int rowCnt = rsvnAccomService.count(map);
		PageUtil pu = new PageUtil(pageNum, rowCnt, 8, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<RsvnAccomVo> list = rsvnAccomService.list(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("keyword", keyword);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("cnt", cnt);
		System.out.println(pu.getStartRow() + ", " + pu.getEndRow());
		return ".reservation.rsvnList";
	}
}
