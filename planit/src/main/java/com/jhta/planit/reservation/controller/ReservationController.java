package com.jhta.planit.reservation.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.jhta.planit.reservation.service.RsvnRoomService;
import com.jhta.planit.reservation.vo.RsvnAccomVo;
import com.jhta.planit.room.service.RoomService;
import com.jhta.planit.room.vo.RoomVo;
import com.jhta.planit.roomImage.service.RoomImageService;
import com.jhta.planit.roomImage.vo.RoomImageVo;
import com.jhta.util.PageUtil;

@Controller
public class ReservationController {
	@Autowired private RsvnAccomService rsvnAccomService;
	@Autowired private AccomService accomService;
	@Autowired private RoomService roomService;
	@Autowired private RsvnRoomService rsvnRoomService;
	@Autowired private RoomImageService roomImageService;
	
	@RequestMapping("/reservation/pay")
	@ResponseBody
	public Object pay(String name, String email, String phone, String item_name, String total_amount) {
		
		
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
		return ".reservation.payApproval";
	}
	
	@RequestMapping("/reservation/payCancel")
	public String payCancel() {
		return ".reservation.payCancel";
	}
	
	@RequestMapping("/reservation/payFail")
	public String payFail() {
		return ".reservation.payFail";
	}
	
	@RequestMapping("/reservation/book")
	public String goBook(int accom_num, int room_num, String checkin, String checkout, int cnt, int stay, Model model) {
		AccomVo avo = accomService.detail(accom_num);
		RoomVo rvo = roomService.detail(room_num);
		rvo.setRoom_images(roomImageService.list(room_num));
		
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
		System.out.println(map);
		RoomVo vo = rsvnRoomService.check(map);
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
		
		System.out.println(accom_num + " / " + checkin + " / " + checkout + " / " + cnt);
		
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
