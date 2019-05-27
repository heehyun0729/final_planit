package com.jhta.planit.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.MembersVo;

@Repository
public class MembersDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.user.mybatis.membersMapper";

	public int membersJoin(MembersVo vo) {
		return sqlSession.insert(NAMESPACE + ".membersJoin", vo);
	}

	public MembersVo login(HashMap<String, String> map) {
		return sqlSession.selectOne(NAMESPACE + ".loginbcry", map);
	}
}
