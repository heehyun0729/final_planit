package com.jhta.planit.review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.review.vo.ReviewCommVo;

@Repository
public class ReviewCommDao {
	private final String NAMESPACE="com.jhta.planit.review.mybatis.ReviewCommMapper";
	@Autowired private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	//±Ûµî·Ï
	public int insert(ReviewCommVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	//´ñ±Û°¹¼ö
	public int getCount(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".count",review_num);	
	}
	//´ñ±Û¸ñ·Ï
	public List<ReviewCommVo> list(HashMap<String,Integer>map){
		return sqlSession.selectList(NAMESPACE + ".getList",map);
	}
	//´ñ±Û »èÁ¦
	public int updateCommChk(int rcomm_num) {
		return sqlSession.update(NAMESPACE + ".updateCommChk",rcomm_num);
	}
}
