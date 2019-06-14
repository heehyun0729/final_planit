package com.jhta.planit.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.admin.dao.AdminMembersDao;
import com.jhta.planit.admin.dao.AdminMypageDao;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class AdminMembersService {
	@Autowired private AdminMembersDao dao;
	@Autowired private AdminMypageDao mdao;

	public int getTotalRowCount(HashMap<String, Object> map) {
		return dao.getUserTotalRowCount(map);
	}

	public List<MembersVo> getUserList(HashMap<String, Object> map) {
		return dao.getUserList(map);
	}

	@Transactional
	public int changestat(HashMap<String, Object> map) {
		int n=0;
		if ((Integer) map.get("mem_stat") == -3) {
			String mem_id=(String) map.get("mem_id");
			n = dao.withdrawal(mem_id);
			n = n + mdao.withdrawal1(mem_id);
			n = n + mdao.withdrawal2(mem_id);
			n = n + mdao.withdrawal3(mem_id);
			return n;
		}
		return dao.changestat(map);
	}
}
