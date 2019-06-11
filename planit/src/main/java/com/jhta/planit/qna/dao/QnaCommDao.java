package com.jhta.planit.qna.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.qna.vo.QnaCommVo;

@Repository
public class QnaCommDao {
	@Autowired private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.qna.mybatis.QnaCommMapper";
	public int insert(QnaCommVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int getCount(int qna_num) {
		return sqlSession.selectOne(NAMESPACE + ".count",qna_num); 
	}
	public List<QnaCommVo> list(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE + ".getList",map);
	}
}
