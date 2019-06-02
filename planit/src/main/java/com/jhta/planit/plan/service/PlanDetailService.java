package com.jhta.planit.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.plan.dao.PlanDetailDao;
import com.jhta.planit.plan.vo.PlanDetailVo;

@Service
public class PlanDetailService {
	@Autowired private PlanDetailDao planDetailDao;
	
	public int insert(PlanDetailVo vo) {
		return planDetailDao.insert(vo);
	}
	public int count() {
		return planDetailDao.count();
	}
	public List<PlanDetailVo> detail(int plan_num){
		return planDetailDao.detail(plan_num);
	}
}
