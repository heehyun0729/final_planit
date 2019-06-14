package com.jhta.planit.accomQna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.accomQna.vo.AccomQnaVo;

@Repository
public class AccomQnaDao {
	@Autowired private SqlSession sqlSession;
	public final String NAMESPACE="com.jhta.planit.accomQna.mybatis.AccomQnaMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(HashMap<String, Object>map) {
		return sqlSession.insert(NAMESPACE + ".insert",map);
	}
	public List<AccomQnaVo> list(HashMap<String, Object>map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}
}
