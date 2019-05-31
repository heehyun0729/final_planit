package com.jhta.planit.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.MembersVo;

@Repository
public class MembersDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.user.mybatis.membersMapper";

	public int membersJoin(MembersVo vo) {
		return sqlSession.insert(NAMESPACE + ".membersJoin", vo);
	}

	public MembersVo login(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".loginbcry", mem_id);
	}

	public MembersVo idcheck(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".idcheck", mem_id);
	}

	public MembersVo emailcheck(String mem_email) {
		return sqlSession.selectOne(NAMESPACE + ".emailcheck", mem_email);
	}

	public MembersVo nickcheck(String mem_nickname) {
		return sqlSession.selectOne(NAMESPACE + ".nickcheck", mem_nickname);
	}

	public int createAuthKey(HashMap<String, Object>map) {
		return sqlSession.insert(NAMESPACE + ".createAuthKey", map);
	}

	public Integer userAuthChk(String userEmail) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".userAuthChk", userEmail);
	}

	public int userAuth(String userEmail) throws Exception {
		return sqlSession.update(NAMESPACE + ".userAuth", userEmail);
	}

}
