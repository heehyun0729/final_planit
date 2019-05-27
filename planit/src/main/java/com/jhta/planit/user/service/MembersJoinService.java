package com.jhta.planit.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jhta.planit.user.dao.MembersJoinDao;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class MembersJoinService {
	@Autowired MembersJoinDao dao;
	@Autowired BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public int membersJoin(MembersVo vo) {
		System.out.println("��ȣȭ ��: "+vo.getMem_pwd());
		String encodingPwd=bCryptPasswordEncoder.encode(vo.getMem_pwd());
		System.out.println("��ȣȭ ��: "+encodingPwd);
		vo.setMem_pwd(encodingPwd);
		return dao.membersJoin(vo);
	}
}
