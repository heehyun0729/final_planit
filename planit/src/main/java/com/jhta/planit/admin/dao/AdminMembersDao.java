package com.jhta.planit.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.MembersVo;

@Repository
public class AdminMembersDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE = "com.jhta.planit.user.mybatis.membersMapper";

	public int getUserTotalRowCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".getUserTotal", map);
	}

	public List<MembersVo> getUserList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".getUserList", map);
	}

	public int changestat(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + ".changestat", map);
	}

	public int withdrawal(String mem_id) {
		return sqlSession.update(NAMESPACE + ".withdrawal", mem_id);
	}
}
