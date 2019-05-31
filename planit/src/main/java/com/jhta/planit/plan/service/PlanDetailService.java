package com.jhta.planit.plan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.plan.dao.PlanDetailDao;

@Service
public class PlanDetailService {
	@Autowired private PlanDetailDao planDetailDao;
}
