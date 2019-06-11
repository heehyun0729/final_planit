package com.jhta.planit.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.user.dao.MypageDao;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class MypageService {
	@Autowired private MypageDao dao;

	public HashMap<Object, Object> profileInfo(HashMap<String, String> parammap) {
		return dao.profileInfo(parammap);
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

	public int follow(HashMap<String, Object> map) {
		String follow_grade = (String) map.get("follow_grade");
		if (follow_grade.equals("0")) {
			return dao.follow(map);
		}else {
			return dao.unfollow(map);
		}
	}

	public int followedcnt(String mem_id) {
		return dao.followedcnt(mem_id);
	}

	public HashMap<String, Object> editprofileinfo(String mem_id) {
		return dao.editprofileinfo(mem_id);
	}
}
