package com.jhta.planit.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.review.vo.ReviewImageVo;

@Repository
public class ReviewImageDao {
	private final String NAMESPACE="com.jhta.planit.review.mybatis.ReviewImageMapper";
	@Autowired 
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public int insert(ReviewImageVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int getReviewImgeNum() {
		return sqlSession.selectOne(NAMESPACE + "getReviewImgeNum");
	}
	public List<ReviewImageVo> list(){
		return sqlSession.selectList(NAMESPACE +".list"); 
	}
	public int delete(int review_num) {
		return sqlSession.delete(NAMESPACE + ".delete",review_num); 
	}
	public ReviewImageVo getinfo(int reviewImge_num) {
		return sqlSession.selectOne(NAMESPACE + ".getinfo",reviewImge_num); 
	}
	public int reviewUpdate(ReviewImageVo vo) {
		return sqlSession.update(NAMESPACE + ".update",vo);
	}
	//»ó¼¼
	public ReviewImageVo detail(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail",review_num);
	}
	public int updateImgChk(int reviewImge_num) {
		return sqlSession.update(NAMESPACE + ".updateImgChk",reviewImge_num);
	}
	public List<ReviewImageVo> detail2(int review_num) {
		return sqlSession.selectList(NAMESPACE + ".detail2", review_num);
	}
	public int reviewImgDelete(int review_num) {
		return sqlSession.delete(NAMESPACE + ".reviewImgDelete",review_num); 
	}
}