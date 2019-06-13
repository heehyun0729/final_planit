package com.jhta.planit.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.admin.dao.AdminUserSellerDao;
import com.jhta.planit.user.dao.UserSellerDao;
import com.jhta.planit.user.vo.SellerVo;

@Service
public class AdminSellerService {
	@Autowired private AdminUserSellerDao dao;

	public int getTotalRowCount(HashMap<String, Object> map) {
		return dao.getTotalRowCount(map);
	}

	public List<HashMap<String, Object>> getSellerList(HashMap<String, Object> map) {
		return dao.getSellerList(map);
	}

	public HashMap<String, Object> getSellerInfo(String mem_id) {
		return dao.getSellerInfo(mem_id);
	}

	public int approval(String mem_id) {
		return dao.approval(mem_id);
	}
}
