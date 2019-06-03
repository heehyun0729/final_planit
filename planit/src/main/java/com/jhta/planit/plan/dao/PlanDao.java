package com.jhta.planit.plan.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.plan.vo.PlanVo;

@Repository
public class PlanDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.plan.mybatis.PlanMapper";
	
	public int insert(PlanVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	public int count() {
		return sqlSession.selectOne(NAMESPACE + ".count");
	}
	public List<PlanVo> list(){
		return sqlSession.selectList(NAMESPACE + ".list");
	}
	public PlanVo detail(int plan_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail", plan_num);
	}
	public int updateStartDate(HashMap<String, String> map) {
		return sqlSession.update(NAMESPACE + ".updateStartDate", map);
	}
}
