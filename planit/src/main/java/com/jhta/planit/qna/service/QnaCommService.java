package com.jhta.planit.qna.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.qna.dao.QnaCommDao;
import com.jhta.planit.qna.vo.QnaCommVo;

@Service
public class QnaCommService {
	@Autowired private QnaCommDao dao;
	public int insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}
	public int getCount(int qna_num) {
		return dao.getCount(qna_num);
	}
	public List<QnaCommVo> list(HashMap<String, Integer> map){
		return dao.list(map);
	}
}
