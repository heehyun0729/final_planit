package com.jhta.planit.qna.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jhta.planit.qna.dao.QnaDao;
import com.jhta.planit.qna.vo.QnaVo;

public class QnaService {
	@Autowired private QnaDao dao;
	public void setDao(QnaDao dao) {
		this.dao = dao;
	}
	public List<QnaVo> list(HashMap<String, Object>map){
		return dao.list(map);
	}
}
