package com.jhta.planit.seller.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.reservation.vo.SellerRsvnVo;
import com.jhta.planit.seller.service.SellerService;
import com.jhta.planit.seller.vo.SellerVo;
import com.jhta.util.PageUtil;

@Controller
public class SellerRsvnController {
	@Autowired RsvnService rsvnService;
	@Autowired SellerService sellerService;
	
	@RequestMapping(value = "/seller/reservation/getList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String getList(HttpSession session) {
		String mem_id = (String)session.getAttribute("mem_id");
		SellerVo svo = sellerService.find(mem_id);
		int sell_num = svo.getSell_num();
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("sell_num", sell_num);
		map.put("complete", "complete");
		List<SellerRsvnVo> list = rsvnService.sellList(map);
		
		JSONArray arr = new JSONArray();
		for(SellerRsvnVo vo : list) {
			JSONObject json = new JSONObject();
			json.put("num", vo.getRsvn_num());
			json.put("id", vo.getMem_id());
			json.put("accom_num", vo.getAccom_num());
			json.put("accom_name", vo.getAccom_name());
			json.put("room_num", vo.getRoom_num());
			json.put("room_type", vo.getRoom_type());
			json.put("room_capa", vo.getRoom_capa());
			json.put("checkin", vo.getRsvn_checkin());
			json.put("checkout", vo.getRsvn_checkout());
			json.put("cnt", vo.getRsvn_cnt());
			json.put("name", vo.getRsvn_name());
			json.put("email", vo.getRsvn_email());
			json.put("phone", vo.getRsvn_phone());
			json.put("total", vo.getRsvnPay_total());
			json.put("stat", vo.getRsvnPay_stat());
			json.put("date", vo.getRsvnPay_date());
			arr.put(json);
		}
		return arr.toString();
	}
	
	@RequestMapping("/seller/reservation/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model, HttpSession session,
			String order, String complete, String checkin, String checkout, String field, String keyword) {
		String mem_id = (String)session.getAttribute("mem_id");
		SellerVo vo = sellerService.find(mem_id);
		int sell_num = vo.getSell_num();
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("sell_num", sell_num);
		map.put("order", order);
		map.put("complete", complete);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("field", field);
		map.put("keyword", keyword);
		
		int rowCnt = rsvnService.sellCount(map);
		PageUtil pu = new PageUtil(pageNum, rowCnt, 5, 5);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		int pageCnt = pu.getTotalPageCount();
		int startPage = pu.getStartPageNum();
		int endPage = pu.getEndPageNum();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<SellerRsvnVo> list = rsvnService.sellList(map);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("order", order);
		model.addAttribute("complete", complete);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("checkin", checkin);
		model.addAttribute("checkout", checkout);
		return "-admin-seller-rsvnList";
	}
}
