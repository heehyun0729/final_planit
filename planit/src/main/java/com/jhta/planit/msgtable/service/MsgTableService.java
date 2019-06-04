package com.jhta.planit.msgtable.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.planit.msgtable.dao.MsgTableDao;
import com.jhta.planit.msgtable.vo.MsgTableVo;

@Service
public class MsgTableService {
	@Autowired private MsgTableDao dao;
	public void setDao(MsgTableDao dao) {
		this.dao =dao;
	}
	public int insert(MsgTableVo vo) {
		return dao.insert(vo);
	}
	public int count(HashMap<String, Object> map) {
		return dao.count(map);
	}
	public List<MsgTableVo> list(HashMap<String, Object> map){
		return dao.list(map);
	}
	public int delete(int num){
		return dao.delete(num);
	}
	public int update1(MsgTableVo vo){
		return dao.update1(vo);
	}
	public int update2(MsgTableVo vo){
		return dao.update2(vo);
	}
	public int updateMsgCheck(int msgNum){
		return dao.updateMsgCheck(msgNum);
	}
	public MsgTableVo find(int msgNum){
		return dao.find(msgNum);
	}
	public MsgTableVo next(int num) {
		return dao.next(num);
	}
	public MsgTableVo prev(int num) {
		return dao.prev(num);
	}
	public int countReceiveList(HashMap<String, Object> map) {
		return dao.countReceiveList(map);
	}
}
