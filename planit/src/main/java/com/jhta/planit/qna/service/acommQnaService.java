package com.jhta.planit.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.qna.dao.acommQnaDao;
import com.jhta.planit.qna.vo.AcommQnaVo;

@Service
public class acommQnaService {
	@Autowired private acommQnaDao dao;
	public void setDao(acommQnaDao dao) {
		this.dao = dao;
	}
	public int insert(AcommQnaVo vo) {
		return dao.insert(vo);
	}
}
