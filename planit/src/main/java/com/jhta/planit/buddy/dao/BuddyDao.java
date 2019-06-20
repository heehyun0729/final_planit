package com.jhta.planit.buddy.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.buddy.vo.BuddyApplyVo;
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
	public List<String> showCoutry(HashMap<String, Object> inc_login){
		return sqlSession.selectList(NAMESPACE + ".buddy_showCountry",inc_login);
	}
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
	//내가 쓴 글 확인
	public List<BuddyListVo> showMgList(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".buddy_MgList",mem_id);
	}
	//게시물 삭제
	public int delete_buddy(String buddy_num) {
		return sqlSession.update(NAMESPACE + ".buddy_del",buddy_num);
	}
	//동행 요청 취소
	public int cancle_apply(HashMap<String, String>find_apply) {
		return sqlSession.update(NAMESPACE + ".cancle",find_apply);
	}
	//동행 요청
	public int apply_buddy(HashMap<String, String> map) {
		return sqlSession.update(NAMESPACE + ".apply_buddy",map);
	}
	//요청 대기
	public List<BuddyApplyVo> buddy_applyList(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".buddy_applyList",mem_id);
	}
	//요청 수락
	public int apply_accept(String apply_num) {
		return sqlSession.update(NAMESPACE + ".apply_accept",apply_num);
	}
	//요청 거절
	public int apply_refuse(String apply_num) {
		return sqlSession.update(NAMESPACE + ".apply_refuse",apply_num);
	}
	//요청 확인
	public List<BuddyListVo> apply_ck(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".apply_ck",mem_id);
	}
	//내 동행 확인
	public List<BuddyVo> mybuddy_ck(String mem_id) {
		return sqlSession.selectList(NAMESPACE + ".mybuddy_ck",mem_id);
	}
	//중복 확인
	public List<BuddyApplyVo> overlap_ck() {
		return sqlSession.selectList(NAMESPACE + ".overlap_ck");
	}
}
