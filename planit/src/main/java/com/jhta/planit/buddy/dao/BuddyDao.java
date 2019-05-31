package com.jhta.planit.buddy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.buddy.vo.BuddyCityVo;
import com.jhta.planit.buddy.vo.BuddyCountryVo;
import com.jhta.planit.buddy.vo.BuddyVo;

@Repository
public class BuddyDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.buddy.mybatis.buddyMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int buddyInsert(BuddyVo vo) {
		return sqlSession.insert(NAMESPACE + ".buddy_insert",vo);
	}
	public int buddyCountryInsert(String data) {
		return sqlSession.insert(NAMESPACE + ".buddyCountry_insert",data);
	}
	public int buddyCityInsert(String data) {
		return sqlSession.insert(NAMESPACE + ".buddyCity_insert",data);
	}
	
	public List<BuddyVo> showAll(){
		return sqlSession.selectList(NAMESPACE + ".buddy_showAll");
	}
	
	public List<String> showCoutry(){
		return sqlSession.selectList(NAMESPACE + ".buddy_showCountry");
	}
	
	public List<BuddyCityVo> showCity(String country){
		return sqlSession.selectList(NAMESPACE + ".buddy_showCity",country);
	}
}
