package com.jhta.planit.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.qna.dao.QnaImageDao;
import com.jhta.planit.qna.vo.QnaImageVo;

@Service
public class QnaImageService {
	@Autowired private QnaImageDao dao;
	public int insert(QnaImageVo vo) {
		return dao.insert(vo);
	}
}
