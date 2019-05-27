package com.jhta.planit.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.user.vo.MembersVo;

@Repository
public class MembersJoinDao {
	@Autowired SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.user.mybatis.membersMapper";

	public int membersJoin(MembersVo vo) {
		System.out.println("dao");
		return sqlSession.insert(NAMESPACE+".membersJoin", vo);
	}
}
