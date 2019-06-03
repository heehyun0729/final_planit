package com.jhta.planit.plan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.plan.dao.PlanDao;
import com.jhta.planit.plan.vo.PlanVo;

@Service
public class PlanService {
	@Autowired private PlanDao planDao;
	
	public int insert(PlanVo vo) {
		return planDao.insert(vo);
	}
	public int count() {
		return planDao.count();
	}
	public List<PlanVo> list() {
		return planDao.list();
	}
	public PlanVo detail(int plan_num) {
		return planDao.detail(plan_num);
	}
	public int updateStartDate(HashMap<String, String> map) {
		return planDao.updateStartDate(map);
	}
}
