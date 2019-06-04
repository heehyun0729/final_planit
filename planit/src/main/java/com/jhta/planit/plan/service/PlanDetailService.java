package com.jhta.planit.plan.service;

import java.util.HashMap;
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
	public List<PlanDetailVo> list(int plan_num){
		return planDetailDao.list(plan_num);
	}
	public int updateDetail(HashMap<String, String> map) {
		return planDetailDao.updateDetail(map);
	}
	public int updateDate(HashMap<String, String> map) {
		return planDetailDao.updateDate(map);
	}
	public int delete(int plan_num) {
		return planDetailDao.delete(plan_num);
	}
}
