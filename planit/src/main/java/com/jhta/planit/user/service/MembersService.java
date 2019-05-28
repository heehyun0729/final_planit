package com.jhta.planit.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.planit.user.dao.MembersDao;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class MembersService {
	@Autowired private MembersDao dao;
	@Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public int membersJoin(MembersVo vo) {
		String encodingPwd=bCryptPasswordEncoder.encode(vo.getMem_pwd());
		vo.setMem_pwd(encodingPwd);
		return dao.membersJoin(vo);
	}

	public boolean login(HashMap<String, String> map) {
		MembersVo vo = dao.login(map.get("mem_id"));
		if (vo != null) {
			return bCryptPasswordEncoder.matches(map.get("mem_pwd"), vo.getMem_pwd());
		}else {
			return false;
		}
	}

	public MembersVo idCheck(String mem_id) {
		return dao.idcheck(mem_id);
	}

	public MembersVo emailCheck(String mem_email) {
		return dao.emailcheck(mem_email);
	}

	public MembersVo nickCheck(String mem_nickname) {
		return dao.nickcheck(mem_nickname);
	}
}
