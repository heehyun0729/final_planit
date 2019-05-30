package com.jhta.planit.user.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.user.dao.MembersDao;
import com.jhta.planit.user.security.AuthenticationKeyGeneration;
import com.jhta.planit.user.security.MailHandler;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class MembersService {
	@Autowired private MembersDao dao;
	@Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Inject
    private JavaMailSender mailSender;
	
	@Transactional
	public int membersJoin(MembersVo vo) throws Exception {
		String encodingPwd=bCryptPasswordEncoder.encode(vo.getMem_pwd());
		vo.setMem_pwd(encodingPwd);
		
		int n=dao.membersJoin(vo);
		String key = new AuthenticationKeyGeneration().getKey(50, false); // 인증키 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("mem_email", vo.getMem_email());
		map.put("authKey", key);
		map.put("mem_id", vo.getMem_id());
		dao.createAuthKey(map);

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Planit 서비스 이메일 인증(네이버 담당자님! 웹구현 테스트 중입니다! 절대 스팸 아닙니다!)]");
		sendMail.setText(
				new StringBuffer().append("<h1>Planit 회원 가입 인증</h1>").append("<a href='http://localhost:9090/planit/member/emailConfirm?mem_email=").append(vo.getMem_email()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("limsr95@gmail.com", "Planit");
		sendMail.setTo(vo.getMem_email());
		sendMail.send();
		return n;
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
	
	public String getId(String mem_email) {
		return dao.getId(mem_email);
	}
	
	@Transactional
	public int userAuth(HashMap<String, String> map) throws Exception {
		Integer mem_stat = dao.userAuthChk(map.get("mem_email"));
		if (mem_stat == 5) {
			int n = (dao.userAuth(map) == dao.delAuth(map.get("mem_email"))) ? 1 : -1;
			return n;
		} else {
			return 0;
		}
	}
}
