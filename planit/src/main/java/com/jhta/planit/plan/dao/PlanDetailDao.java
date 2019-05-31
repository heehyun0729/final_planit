package com.jhta.planit.plan.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.plan.vo.PlanDetailVo;

@Repository
public class PlanDetailDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.plan.mybatis.PlanDetailMapper";
	
	public int insert(PlanDetailVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public int count() {
		return sqlSession.selectOne(NAMESPACE + ".count");
	}
}
