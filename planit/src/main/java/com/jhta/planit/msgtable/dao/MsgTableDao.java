package com.jhta.planit.msgtable.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.jhta.planit.msgtable.vo.MsgTableVo;

@Repository
public class MsgTableDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.msgtable.mybatis.MsgTableMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	public int insert(MsgTableVo vo) {
		return sqlSession.insert(NAMESPACE+".insert",vo);
	}
	public int count(HashMap<String, Object>map) {
		return sqlSession.selectOne(NAMESPACE+ ".count",map);
	}
	public List<MsgTableVo> list(HashMap<String, Object>map){
		return sqlSession.selectList(NAMESPACE+".listAll",map);
	}
	public int delete(int msgNum) {
		return sqlSession.delete(NAMESPACE+".delete",msgNum);
	}
	public MsgTableVo next(int num) {
		return sqlSession.selectOne(NAMESPACE+".next",num);
	}
	public MsgTableVo prev(int num) {
		return sqlSession.selectOne(NAMESPACE+".prev",num);
	}
	public int update1(MsgTableVo vo) {
		return sqlSession.delete(NAMESPACE+".update1",vo);
	}
	public int updateMsgCheck(MsgTableVo vo) {
		return sqlSession.delete(NAMESPACE+".updateMsgCheck",vo);
	}
	public MsgTableVo find(int msgNum) {
		return sqlSession.selectOne(NAMESPACE+".find",msgNum);
	}
}
