package com.jhta.planit.user.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jhta.planit.user.dao.MembersDao;
import com.jhta.planit.user.dao.MypageDao;
import com.jhta.planit.user.security.AuthenticationKeyGeneration;
import com.jhta.planit.user.security.MailHandler;
import com.jhta.planit.user.vo.MembersVo;

@Service
public class MembersService {
	@Autowired private MembersDao dao;
	@Autowired private MypageDao mdao;
	@Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Inject
    private JavaMailSender mailSender;
	
	@Transactional
	public int membersJoin(MembersVo vo) throws Exception {
		String encodingPwd = bCryptPasswordEncoder.encode(vo.getMem_pwd());
		vo.setMem_pwd(encodingPwd);
		int n = dao.membersJoin(vo);

		mdao.joinProfileImg(vo.getMem_id());
		mdao.joinProfileInfo(vo);

		String key = new AuthenticationKeyGeneration().getKey(50, false); // 인증키 생성
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("mem_email", vo.getMem_email());
		map.put("authKey", key);
		map.put("mem_id", vo.getMem_id());
		dao.createAuthKey(map);

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[Planit 서비스 이메일 인증]");
		sendMail.setText(new StringBuffer().append("<h1>Planit 회원 가입 인증</h1>")
				.append("<a href='http://localhost:9090/planit/member/emailConfirm?mem_email=")
				.append(vo.getMem_email()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("limsr95@gmail.com", "Planit");
		sendMail.setTo(vo.getMem_email());
		sendMail.send();
		return n;
	}

	public int login(HashMap<String, String> map) {
		int n = -5;
		MembersVo vo = dao.login(map.get("mem_id"));
		if (vo != null) {
			if (bCryptPasswordEncoder.matches(map.get("mem_pwd"), vo.getMem_pwd())) {
				n = vo.getMem_stat();
			}
		}
		return n;
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
		if (mem_stat == -1) {
			int n = (dao.userAuth(map) == dao.delAuth(map.get("mem_email"))) ? 1 : -1;
			return n;
		} else {
			return 0;
		}
	}

	public boolean userCheck(HashMap<String, String> map) {
		MembersVo vo = dao.userCheck(map.get("mem_id"));
		if (vo != null) {
			if (bCryptPasswordEncoder.matches(map.get("mem_pwd"), vo.getMem_pwd())) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public int pwdChange(HashMap<String, Object> map) {
		int n = -1;
		MembersVo vo = dao.userCheck((String) map.get("mem_id"));
		if ((Boolean) map.get("forgot")) {
			String encodingPwd = bCryptPasswordEncoder.encode((String) map.get("mem_pwd"));
			map.put("mem_pwd", encodingPwd);
			n = dao.pwdChange(map);
		} else {
			if (bCryptPasswordEncoder.matches((String) map.get("before_mem_pwd"), vo.getMem_pwd())) {
				String encodingPwd = bCryptPasswordEncoder.encode((String) map.get("mem_pwd"));
				map.put("mem_pwd", encodingPwd);
				n = dao.pwdChange(map);
			} else {
				n = -10;
			}
		}
		return n;
	}

	@Transactional
	public int withdrawal(HashMap<String, String> map) {
		int n = -1;
		MembersVo vo = dao.userCheck(map.get("mem_id"));

		if (bCryptPasswordEncoder.matches(map.get("mem_pwd"), vo.getMem_pwd())) {
			n = dao.withdrawal(map.get("mem_id"));
			n = n + mdao.withdrawal1(map.get("mem_id"));
			n = n + mdao.withdrawal2(map.get("mem_id"));
			n = n + mdao.withdrawal3(map.get("mem_id"));
		} else {
			n = -10;
		}
		return n;
	}

	public String idsearch(String mem_email) {
		return dao.idsearch(mem_email);
	}

	public boolean pwdsearch(HashMap<String, Object> map) throws Exception {
		boolean b = true;
		if (dao.pwdsearch(map) != null) {
			String key = new AuthenticationKeyGeneration().getKey(50, false);

			map.put("authKey", key);
			dao.createAuthKey(map);

			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[Planit 비밀번호 찾기]");
			sendMail.setText(new StringBuffer().append("<h1>Planit 회원 비밀번호 찾기</h1>")
					.append("<a href='http://localhost:9090/planit/member/pwdChangeemailConfirm?mem_email=")
					.append(map.get("mem_email")).append("&key=").append(key).append("' target='_blenk'>비밀번호 찾기</a>")
					.toString());
			sendMail.setFrom("limsr95@gmail.com", "Planit");
			sendMail.setTo((String) map.get("mem_email"));
			sendMail.send();
		} else {
			b = false;
		}
		return b;
	}
	
	public MembersVo noInfo(String mem_id) {
		MembersVo vo=dao.userCheck(mem_id);
		vo.setMem_pwd(null);
		vo.setMem_stat(-10);
		vo.setMem_api(null);
		return vo;
	}

	public boolean pwdemail(HashMap<String, String> map) {
		if (dao.selectuserAuth(map) != null) {
			return true;
		} else {
			return false;
		}
	}
}
