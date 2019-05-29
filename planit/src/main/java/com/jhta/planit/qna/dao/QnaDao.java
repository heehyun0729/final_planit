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
	public int insert(QnaVo vo) {
		return sqlSession.selectOne(NAMESPACE + ".insert",vo);
	}
	/*public List<QnaVo> list(HashMap<String, Object>map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}*/
	
}
