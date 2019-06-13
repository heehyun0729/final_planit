package com.jhta.planit.seller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.seller.dao.SellerDao;
import com.jhta.planit.seller.vo.SellerVo;

@Service
public class SellerService {
	@Autowired private SellerDao sellerDao;
	
	public SellerVo find(String mem_id) {
		return sellerDao.find(mem_id);
	}
}
