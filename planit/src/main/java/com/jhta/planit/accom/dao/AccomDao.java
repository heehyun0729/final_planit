package com.jhta.planit.accom.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accom.vo.AccomVo;
import com.jhta.planit.accomQna.vo.AccomQnaVo;

@Repository
public class AccomDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.accom.mybatis.AccomMapper";

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	public int insert(AccomVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public int count(HashMap<String,Object> map) {
		return sqlSession.selectOne(NAMESPACE +".count",map);
	}
	public List<AccomVo> list(HashMap<String,Object> map){
		return sqlSession.selectList(NAMESPACE+".list",map);
	}
	public List<AccomVo> list1(HashMap<String,Object> map){
		return sqlSession.selectList(NAMESPACE+".list1",map);
	}
	public AccomVo next(int accom_num) {
		return sqlSession.selectOne(NAMESPACE +".next",accom_num);
	}
	public AccomVo prev(int accom_num) {
		return sqlSession.selectOne(NAMESPACE +".prev",accom_num);
	}
	public int updateAccomCheck(int accom_num) {
		return sqlSession.update(NAMESPACE+".updateAccomCheck",accom_num);
	}
	public AccomVo detail(int accom_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail", accom_num);
	}
	public AccomVo detail1(int accom_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail1", accom_num);
	}
	
	public int update(AccomVo vo) {
		return sqlSession.update(NAMESPACE +".update",vo);
	}
}
