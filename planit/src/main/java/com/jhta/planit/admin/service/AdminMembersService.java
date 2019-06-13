package com.jhta.planit.admin.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.admin.dao.AdminMembersDao;
import com.jhta.planit.admin.dao.AdminMypageDao;
import com.jhta.planit.admin.dao.AdminUserSellerDao;
import com.jhta.planit.admin.vo.AdVo;
import com.jhta.planit.user.dao.MembersDao;
import com.jhta.planit.user.dao.MypageDao;
import com.jhta.planit.user.security.AuthenticationKeyGeneration;
import com.jhta.planit.user.security.MailHandler;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class AdminMembersService {
	@Autowired private AdminMembersDao dao;
	@Autowired private AdminMypageDao mdao;

	public int getTotalRowCount(HashMap<String, Object> map) {
		return dao.getUserTotalRowCount(map);
	}

	public List<MembersVo> getUserList(HashMap<String, Object> map) {
		return dao.getUserList(map);
	}

	public int changestat(HashMap<String, Object> map) {
		return dao.changestat(map);
	}
}
