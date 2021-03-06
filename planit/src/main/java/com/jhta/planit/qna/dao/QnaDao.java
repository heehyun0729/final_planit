package com.jhta.planit.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.qna.vo.QnaVo;
@Repository
public class QnaDao {
	@Autowired private SqlSession sqlSession;
	public final String NAMESPACE="com.jhta.planit.qna.mybatis.QnaMapper";
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public int insert(QnaVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public List<QnaVo> list(HashMap<String, Object>map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}
	public QnaVo detail(int qna_num) {
		return sqlSession.selectOne(NAMESPACE + ".details",qna_num);
	}
	public int count(HashMap<String , Object>map) {
		return sqlSession.selectOne(NAMESPACE + ".count",map);
	}
	public QnaVo next(int qna_num) {
		return sqlSession.selectOne(NAMESPACE + ".next",qna_num);
	}
	public QnaVo prev(int qna_num) {
		return sqlSession.selectOne(NAMESPACE + ".prev",qna_num);
	}
	public int delete(int qna_num) {
		return sqlSession.delete(NAMESPACE + ".delete",qna_num);
	}
	public QnaVo getinfo(int qna_num) {
		return sqlSession.selectOne(NAMESPACE + ".getinfo",qna_num);
	}
	public int update(HashMap<String, Object>map) {
		return sqlSession.update(NAMESPACE + ".update",map);
	}
}
