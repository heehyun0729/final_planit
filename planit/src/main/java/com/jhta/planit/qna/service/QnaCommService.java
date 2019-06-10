package com.jhta.planit.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.qna.dao.QnaCommDao;
import com.jhta.planit.qna.vo.QnaCommVo;

@Service
public class QnaCommService {
	@Autowired private QnaCommDao dao;
	public int insert(QnaCommVo vo) {
		return dao.insert(vo);
	}
}
