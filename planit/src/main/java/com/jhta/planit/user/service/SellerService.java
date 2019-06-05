package com.jhta.planit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.user.dao.UserSellerDao;
import com.jhta.planit.user.vo.SellerVo;

@Service
public class SellerService {
	@Autowired private UserSellerDao dao;

	public int sellJoin(SellerVo vo) {
		return dao.sellJoin(vo);
	}
	
}
