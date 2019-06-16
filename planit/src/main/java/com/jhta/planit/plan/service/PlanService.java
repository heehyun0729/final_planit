package com.jhta.planit.plan.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jhta.planit.plan.dao.PlanDao;
import com.jhta.planit.plan.vo.PlanListVo;
import com.jhta.planit.plan.vo.PlanVo;

@Service
public class PlanService {
	@Autowired private PlanDao planDao;
	
	public int insert(PlanVo vo) {
		return planDao.insert(vo);
	}
	public int max() {
		return planDao.max();
	}
	public int count(HashMap<String, Object> map) {
		return planDao.count(map);
	}
	public List<PlanListVo> list(HashMap<String, Object> map) {
		return planDao.list(map);
	}
	public PlanVo detail(int plan_num) {
		return planDao.detail(plan_num);
	}
	public int updateStartDate(HashMap<String, String> map) {
		return planDao.updateStartDate(map);
	}
	public int updateInfo(HashMap<String, String> map) {
		return planDao.updateInfo(map);
	}
	public int delete(int plan_num) {
		return planDao.delete(plan_num);
	}
	public int update(HashMap<String, String> map) {
		return planDao.update(map);
	}
}
