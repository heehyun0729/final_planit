package com.jhta.planit.accom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.accom.dao.AccomDao;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.seller.dao.SellerDao;
import com.jhta.planit.seller.vo.SellerVo;


@Service
public class AccomService {
	@Autowired private AccomDao dao;
	@Autowired private SellerDao sellerDao;
	public void setDao(AccomDao dao) {
		this.dao =dao;
	}
	public int insert(AccomVo vo) {
		return dao.insert(vo);
	}
	public SellerVo find(String mem_id){
		return sellerDao.find(mem_id);
	}
}
