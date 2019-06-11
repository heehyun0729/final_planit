package com.jhta.planit.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.user.dao.MembersDao;
import com.jhta.planit.user.dao.MypageDao;
import com.jhta.planit.user.vo.MemImageVo;
import com.jhta.planit.user.vo.ProfileVo;

@Service
public class MypageService {
	@Autowired private MypageDao dao;
	@Autowired private MembersDao mdao;

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

	public MemImageVo getsavImginfo(int img_num) {
		return dao.getsavImginfo(img_num);
	}

	@Transactional
	public int editprofile(MemImageVo imgVo, ProfileVo profileVo, String mem_nick) {
		int n = 0;
		if (imgVo != null) {
			n = dao.editImg(imgVo);
		}
		n = n + dao.editprofile(profileVo);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("mem_id", profileVo.getMem_id());
		map.put("mem_nickname", mem_nick);
		n = n + mdao.nickupdate(map);
		return n;
	}
}
