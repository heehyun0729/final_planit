package com.jhta.planit.qna.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.qna.dao.QnaDao;
import com.jhta.planit.qna.vo.QnaVo;
@Service
public class QnaService {
	@Autowired private QnaDao dao;
	public void setDao(QnaDao dao) {
		this.dao = dao;
	}
	public List<QnaVo> list(HashMap<String, Object>map){
		return dao.list(map);
	}
	public int insert(QnaVo vo) {
		return dao.insert(vo);
	}
	public QnaVo detail(int qna_num) {
		return dao.detail(qna_num);
	}
	public int count(HashMap<String, Object> map){
		return dao.count(map);
	}
	public QnaVo next(int qna_num) {
		return dao.next(qna_num);
	}
	public QnaVo prev(int qna_num) {
		return dao.prev(qna_num);
	}
	public int update(QnaVo vo) {
		return dao.update(vo);
	}
	public int delete(int qna_num) {
		return dao.delete(qna_num);
	}
	/*public int getinfo(int qna_num) {
		return dao.
	}*/
}
