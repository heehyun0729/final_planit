package com.jhta.planit.seller.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.reservation.vo.SellerRsvnVo;
import com.jhta.planit.seller.service.SellerService;
import com.jhta.planit.seller.vo.SellerVo;
import com.jhta.util.PageUtil;

@Controller
public class SellerRsvnController {
	@Autowired RsvnService rsvnService;
	@Autowired SellerService sellerService;
	
	@RequestMapping("/seller/reservation/list")
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, String mem_id, Model model,
			String order, String complete, String checkin, String checkout, String field, String keyword) {
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
		return ".seller.rsvnList";
	}
}
