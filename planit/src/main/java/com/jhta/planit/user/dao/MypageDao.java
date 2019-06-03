package com.jhta.planit.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.MembersVo;

@Repository
public class MypageDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.user.mybatis.mypageMapper";

	public HashMap<Object, Object> profileInfo(String mem_id) {
		System.out.println("dao");
		return sqlSession.selectOne(NAMESPACE + ".profileInfo", mem_id);
	}

	public void joinProfileImg(String mem_id) {
		sqlSession.insert(NAMESPACE + ".joinProfileImg", mem_id);
	}

	public void joinProfileInfo(MembersVo vo) {
		sqlSession.insert(NAMESPACE + ".joinProfileInfo", vo);
	}
}
