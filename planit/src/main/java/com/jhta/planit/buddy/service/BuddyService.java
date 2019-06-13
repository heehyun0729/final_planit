package com.jhta.planit.buddy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	//�۵��
	public int buddyInsert(BuddyVo vo,BuddyCountryVo countryVo,BuddyCityVo cityVo) {
		String country=countryVo.getBuddy_country();
		String[] countries=country.split(",");
		String city=cityVo.getBuddy_city();
		String[] cities=city.split(",");
		
		//���� ���̺� �߰�
		int n1=dao.buddyInsert(vo);
		System.out.println("�����ϰ�� : "+n1);
		
		//�����������̺� �߰�
		for(int i=0;i<countries.length;i++) {
			String cr=countries[i];
			String ct=cities[i];
			int n2=dao.buddyCountryInsert(cr);
			int n3=dao.buddyCityInsert(ct);
		}
		return n1;
	}
	//��ü �� ����
	public int count(HashMap<String, Object> find_map) {
		return dao.count(find_map);
	}
	//��ü ����Ʈ
	public List<BuddyListVo> showAll(HashMap<String, Object> find_map){
		return dao.showAll(find_map);
	}
	//���� üũ�ڽ� ��������
	public List<String> showCountry(){
		return dao.showCoutry();
	}
	//���� üũ�ڽ� ��������
	public List<BuddyCityVo> showCity(String country){
		return dao.showCity(country);
	}
	//��¥ ���� �Խù� �ڵ� ����
	public int updateState() {
		return dao.updateState();
	}
	//������õ
	public List<String> sameDateCity(String id) {
		return dao.sameDateCity(id);
	}
	//�����
	public BuddyListVo detail(String id){
		return dao.detail(id);
	}
	//���� �� �� Ȯ��
	public List<BuddyListVo> showMgList(String mem_id){
		return dao.showMgList(mem_id);
	}
	//�Խù� ����
	public int delete_buddy(String buddy_num) {
		return dao.delete_buddy(buddy_num);
	}
	//���� ��û
	public int apply_buddy(HashMap<String, String> map) {
		return dao.apply_buddy(map);
	}
	//��û Ȯ��
	public List<BuddyApplyVo> buddy_applyList(String mem_id) {
		return dao.buddy_applyList(mem_id);
	}
}
