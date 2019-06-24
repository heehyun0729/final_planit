package com.jhta.planit.accomQna.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jhta.planit.accomQna.dao.AccomQnaDao;
import com.jhta.planit.accomQna.vo.AccomQnaVo;
@Service
public class AccomQnaService {
	@Autowired private AccomQnaDao dao;
	public int insertAcq(HashMap<String, Object>map) {
		return dao.insertAcq(map);
	}
	public List<AccomQnaVo> acqList(HashMap<String, Object>map){
		return dao.acqList(map);
	}
	public int count(HashMap<String, Object>map) {
		return dao.count(map);
	}
	public int delete(HashMap<String, Object>map) {
		return dao.deleteAcq(map);
	}
}