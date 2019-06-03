package com.jhta.planit.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.user.dao.MypageDao;

@Service
public class MypageService {
	@Autowired private MypageDao dao;

	public HashMap<Object, Object> profileInfo(String mem_id) {
		return dao.profileInfo(mem_id);
	}

	public List<HashMap<Object, Object>> followedlist(String mem_id) {
		return dao.followedlist(mem_id);
	}

	public List<HashMap<Object, Object>> followlist(String mem_id) {
		return dao.followlist(mem_id);
	}

	public List<HashMap<Object, Object>> postslist(String mem_id) {
		return dao.postslist(mem_id);
	}

	public List<HashMap<Object, Object>> travel(String mem_id) {
		return dao.travel(mem_id);
	}

	public List<HashMap<Object, Object>> comments(String mem_id) {
		return dao.comments(mem_id);
	}

	public List<HashMap<Object, Object>> book(String mem_id) {
		return dao.book(mem_id);
	}
}
