package com.jhta.planit.accom.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.accom.dao.AccomDao;
import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.accomQna.dao.AccomQnaDao;
import com.jhta.planit.accomQna.vo.AccomQnaVo;
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
	public int count(HashMap<String,Object> map) {
		return dao.count(map);
	}
	public List<AccomVo> list(HashMap<String,Object> map){
		return dao.list(map);
	}
	public List<AccomVo> list1(HashMap<String,Object> map){
		return dao.list1(map);
	}
	public AccomVo next(int accom_num) {
		return dao.next(accom_num);
	}
	public AccomVo prev(int accom_num) {
		return dao.prev(accom_num);
	}
	public int updateAccomCheck(int accom_num){
		return dao.updateAccomCheck(accom_num);
	}
	public AccomVo detail(int accom_num) {
		return dao.detail(accom_num);
	}
	public int update(AccomVo vo) {
		return dao.update(vo);
	}
	public int insertAcq(HashMap<String, Object>map) {
		return dao.insertAcq(map);
	}
	/*public List<AccomQnaVo> acqList(HashMap<String, Object>map){
		return dao.acqList(map);
	}*/
}
