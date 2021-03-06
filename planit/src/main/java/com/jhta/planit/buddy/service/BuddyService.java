package com.jhta.planit.buddy.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.buddy.dao.BuddyDao;
import com.jhta.planit.buddy.vo.BuddyApplyVo;
import com.jhta.planit.buddy.vo.BuddyCityVo;
import com.jhta.planit.buddy.vo.BuddyCountryVo;
import com.jhta.planit.buddy.vo.BuddyListVo;
import com.jhta.planit.buddy.vo.BuddyVo;

@Service
public class BuddyService {
	@Autowired private BuddyDao dao;
	public void setDao(BuddyDao dao) {
		this.dao = dao;
	}
	//글등록
	public int buddyInsert(BuddyVo vo,BuddyCountryVo countryVo,BuddyCityVo cityVo) {
		String country=countryVo.getBuddy_country();
		String[] countries=country.split(",");
		String city=cityVo.getBuddy_city();
		String[] cities=city.split(",");

		//동행 테이블에 추가
		int n1=dao.buddyInsert(vo);
		System.out.println("동행등록결과 : "+n1);
		
		//국가도시테이블에 추가
		for(int i=0;i<countries.length;i++) {
			String cr=countries[i];
			String ct=cities[i];
			int n2=dao.buddyCountryInsert(cr);
			int n3=dao.buddyCityInsert(ct);
		}
		return n1;
	}
	//전체 글 갯수
	public int count(HashMap<String, Object> find_map) {
		return dao.count(find_map);
	}
	//전체 리스트
	public List<BuddyListVo> showAll(HashMap<String, Object> find_map){
		return dao.showAll(find_map);
	}
	//국가 체크박스 동적생성
	public List<String> showCountry(HashMap<String, Object> inc_login){
		return dao.showCoutry(inc_login);
	}
	public List<String> showCountry(){
		return dao.showCoutry();
	}
	//도시 체크박스 동적생성
	public List<BuddyCityVo> showCity(String country){
		return dao.showCity(country);
	}
	//날짜 지난 게시물 자동 업뎃
	public int updateState() {
		return dao.updateState();
	}
	//동행추천
	public List<String> sameDateCity(String id) {
		return dao.sameDateCity(id);
	}
	//동행상세
	public BuddyListVo detail(String id){
		return dao.detail(id);
	}
	//내가 쓴 글 확인
	public List<BuddyListVo> showMgList(String mem_id){
		return dao.showMgList(mem_id);
	}
	//게시물 삭제
	public int delete_buddy(String buddy_num) {
		return dao.delete_buddy(buddy_num);
	}
	//동행 요청 취소
	public int cancle_apply(HashMap<String, String>find_apply) {
		return dao.cancle_apply(find_apply);
	}
	//동행 요청
	public int apply_buddy(HashMap<String, String> map) {
		return dao.apply_buddy(map);
	}
	//요청 확인
	public List<BuddyApplyVo> buddy_applyList(String mem_id) {
		return dao.buddy_applyList(mem_id);
	}
	//요청 수락
	public int apply_accept(String apply_num) {
		return dao.apply_accept(apply_num);
	}
	//요청 거절
	public int apply_refuse(String apply_num) {
		return dao.apply_refuse(apply_num);
	}
	//요청 확인
	public List<BuddyListVo> apply_ck(String mem_id) {
		return dao.apply_ck(mem_id);
	}
	//내 동행 확인
	public List<BuddyVo> mybuddy_ck(String mem_id) {
		return dao.mybuddy_ck(mem_id);
	}
	//중복 확인
	public List<BuddyApplyVo> overlap_ck() {
		return dao.overlap_ck();
	}
}
