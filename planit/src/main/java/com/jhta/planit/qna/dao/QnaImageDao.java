package com.jhta.planit.qna.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.qna.vo.QnaImageVo;
@Repository
public class QnaImageDao {
	public final String NAMESPACE="com.jhta.planit.qna.mybatis.qnaImageMapper";
	@Autowired private SqlSession sqlSession;
	public int insert(QnaImageVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);	
	}
}
