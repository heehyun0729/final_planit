package com.jhta.planit.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.planit.reservation.service.RsvnService;
import com.jhta.planit.user.service.SellerService;

@Controller
public class SellerRsvnController {
	@Autowired RsvnService rsvnService;
	@Autowired SellerService sellerService;
	
	@RequestMapping("/seller/reservation/list")
	public String list(String mem_id) {
		return ".seller.rsvnList";
	}
}
