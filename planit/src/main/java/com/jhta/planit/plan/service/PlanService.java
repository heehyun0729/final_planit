package com.jhta.planit.plan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.plan.dao.PlanDao;
import com.jhta.planit.plan.vo.PlanVo;

@Service
public class PlanService {
	@Autowired private PlanDao planDao;
	
	@Transactional
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
	@Transactional
	public int updateStartDate(HashMap<String, String> map) {
		return planDao.updateStartDate(map);
	}
	@Transactional
	public int updateInfo(HashMap<String, String> map) {
		return planDao.updateInfo(map);
	}
	@Transactional
	public int delete(int plan_num) {
		return planDao.delete(plan_num);
	}
	@Transactional
	public int update(HashMap<String, String> map) {
		return planDao.update(map);
	}
}
