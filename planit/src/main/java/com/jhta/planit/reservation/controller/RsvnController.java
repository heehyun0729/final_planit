package com.jhta.planit.reservation.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.planit.accom.service.AccomService;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.accomQna.service.AccomQnaService;
import com.jhta.planit.accomQna.vo.AccomQnaVo;
import com.jhta.planit.reservation.service.RsvnAccomService;
import com.jhta.planit.reservation.service.RsvnPayService;
import com.jhta.planit.reservation.service.RsvnRoomService;
import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.reservation.vo.RsvnAccomVo;
import com.jhta.planit.reservationReview.service.ReservationReviewService;
import com.jhta.planit.reservationReview.vo.ReservationReviewVo;
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
	@Autowired private AccomQnaService acqService;
	@Autowired private ReservationReviewService reservationReviewService;
	
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
				return "redirect:/member/mypage/" + mem_id + "/reservation/list";
			}else {
				return ".error";
			}
		}else {
			rsvnService.delete(num);
			return ".error";
		}
	}
	
	@RequestMapping(value = "/reservation/payRefund", produces="application/json;charset=utf-8")
	@ResponseBody
	public Object payRefund(int rsvn_num, String tid) {
		rsvnPayService.cancel(tid);	// DB 수정
		
		int cancel_amount = rsvnPayService.detailByRsvnNum(rsvn_num).getRsvnPay_total();
		
		RestTemplate restTemplate = new RestTemplate();
		String host = "https://kapi.kakao.com/v1/payment/cancel";
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK 701d2fb4d9d20c3624d31b24e8e0caab");
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", tid);
        params.add("cancel_amount", String.valueOf(cancel_amount));
        params.add("cancel_tax_free_amount", "0");
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        Object object = restTemplate.postForObject(host, body, Map.class);        
        return object;
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
			fr = new FileReader(new File("C:\\spring\\planit2\\src\\main\\webapp\\resources\\apiKey.txt"));
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
	
	@RequestMapping("/reservation/accomDetail")
	public String detail(int accom_num, String checkin, String checkout, 
			@RequestParam(value = "pageNum" , defaultValue = "1")int pageNum,
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
		List<String> imgList = new ArrayList<String>();
		for(RoomVo vo : rlist) {
			String str1 = vo.getRoom_comm().replaceAll("\n", "<br>");
			vo.setRoom_comm(str1);
			List<RoomImageVo> ilist = roomImageService.list(vo.getRoom_num());
			vo.setRoom_images(ilist);
			for(RoomImageVo ivo : ilist) {
				imgList.add(ivo.getRoomImg_saveImg());
			}
		} 
		List<ReservationReviewVo> rrlist=reservationReviewService.list(accom_num);
		model.addAttribute("rrlist", rrlist);
		model.addAttribute("avo", avo);
		model.addAttribute("rlist", rlist);
		model.addAttribute("imgList", imgList);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		model.addAttribute("cnt", cnt);
		model.addAttribute("accom_num", accom_num);
		
		//숙소문의 댓글목록
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("pageNum", pageNum);
		int totalRowCount = acqService.count(map2);
		PageUtil pu = new PageUtil(pageNum, totalRowCount, 5, 5);
		map2.put("startRow", pu.getStartRow());
		map2.put("endRow", pu.getEndRow());
		List<AccomQnaVo> list=acqService.acqList(map2);
		model.addAttribute("list", list);
		model.addAttribute("pu", pu);

		
		return ".reservation.accomDetail";

	}
	

	@RequestMapping("/reservation/accomList")
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
		return ".reservation.accomList";
	}
	//숙소 댓글 등록
	@RequestMapping(value="/reservation/acqInsert", method=RequestMethod.POST)
	public String insert(int tab,String mem_id,int accom_num,String accomqna_title,String accomqna_content) {
		ModelAndView mv=new ModelAndView();
		HashMap<String, Object>map = new HashMap<String, Object>();
		//System.out.println(map);
		map.put("mem_id",mem_id);
		map.put("accom_num",accom_num);
		map.put("accomqna_title",accomqna_title);
		map.put("accomqna_content",accomqna_content);
		mv.addObject("accom_num", accom_num);
		mv.addObject("tab", tab);
		acqService.insertAcq(map);
		return "redirect:/reservation/accomDetail?accom_num=" + accom_num +"&tab=" + tab;
	}
}
