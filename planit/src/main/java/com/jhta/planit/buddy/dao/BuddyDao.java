package com.jhta.planit.buddy.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.buddy.vo.BuddyCityVo;
import com.jhta.planit.buddy.vo.BuddyCountryVo;
import com.jhta.planit.buddy.vo.BuddyListVo;
import com.jhta.planit.buddy.vo.BuddyVo;

@Repository
public class BuddyDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.buddy.mybatis.buddyMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//글쓰기
	public int buddyInsert(BuddyVo vo) {
		return sqlSession.insert(NAMESPACE + ".buddy_insert",vo);
	}
	//국가 테이블에 추가
	public int buddyCountryInsert(String data) {
		return sqlSession.insert(NAMESPACE + ".buddyCountry_insert",data);
	}
	//도시 테이블에 추가
	public int buddyCityInsert(String data) {
		return sqlSession.insert(NAMESPACE + ".buddyCity_insert",data);
	}
	//전체 글 갯수 얻어오기
	public int count(HashMap<String, Object> find_map) {
		return sqlSession.selectOne(NAMESPACE + ".count",find_map);
	}
	//전체 리스트
	public List<BuddyListVo> showAll(HashMap<String, Object> find_map){
		System.out.println("map:" +find_map);
		return sqlSession.selectList(NAMESPACE + ".buddy_showAll",find_map);
	}
	//국가 체크박스 동적 생성
	public List<String> showCoutry(){
		return sqlSession.selectList(NAMESPACE + ".buddy_showCountry");
	}
	//도시 체크박스 동적 생성
	public List<BuddyCityVo> showCity(String country){
		return sqlSession.selectList(NAMESPACE + ".buddy_showCity",country);
	}
	//날짜 지난 게시물 자동 업뎃
	public int updateState() {
		return sqlSession.update(NAMESPACE + ".buddy_stateUpt");
	}
	//동행추천
	public List<String> sameDateCity(String id) {
		return sqlSession.selectList(NAMESPACE + ".buddy_sameDateCity",id);
	}
	//동행상세
	public BuddyListVo detail(String id) {
		return sqlSession.selectOne(NAMESPACE + ".buddy_detail",id);
	}
}
