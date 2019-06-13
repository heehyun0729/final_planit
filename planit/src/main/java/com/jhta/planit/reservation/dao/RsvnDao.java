package com.jhta.planit.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservation.vo.MyRsvnVo;
import com.jhta.planit.reservation.vo.RsvnVo;
import com.jhta.planit.reservation.vo.SellerRsvnVo;

@Repository
public class RsvnDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.reservation.mybatis.RsvnMapper";
	
	public int insert(HashMap<String, Object> map) {
		return sqlSession.insert(NAMESPACE + ".insert", map);
	}
	public int max() {
		return sqlSession.selectOne(NAMESPACE + ".max");
	}
	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + ".delete", num);
	}
	public List<MyRsvnVo> myList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".myList", map);
	}
	public int myCount(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".myCount", mem_id);
	}
	public RsvnVo detail(int num) {
		return sqlSession.selectOne(NAMESPACE + ".detail", num);
	}
	public List<SellerRsvnVo> sellList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".sellList", map);
	}
	public int sellCount(int sell_num) {
		return sqlSession.selectOne(NAMESPACE + ".sellCount", sell_num);
	}
}
