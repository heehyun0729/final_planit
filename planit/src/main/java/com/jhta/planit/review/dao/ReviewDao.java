package com.jhta.planit.review.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.review.vo.ReviewImageVo;
import com.jhta.planit.review.vo.ReviewLikeVo;
import com.jhta.planit.review.vo.ReviewVo;

@Repository
public class ReviewDao {
	private final String NAMESPACE="com.jhta.planit.review.mybatis.ReviewMapper";
	@Autowired private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	//댓글등록
	public int insert (ReviewVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo);
	}
	public int getReviewNum() {
		return sqlSession.selectOne(NAMESPACE + ".getReviewNum");
	}
	
	//댓글갯수
	public int count(HashMap<String, Object>map) {
		return sqlSession.selectOne(NAMESPACE + ".count",map);
	}
	//댓글목록
	public List<ReviewVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}
	//조회수
	public int addHit(int review_num) {
		return sqlSession.update(NAMESPACE + ".addHit" ,review_num); 
	}
	//상세
	public ReviewVo detail(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".detail",review_num);
	}
	//검색
	public ReviewVo getinfo(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".getinfo",review_num);
	}
	//다음글
	public ReviewVo next(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".next",review_num);
	}
	//이전글
	public ReviewVo prev(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".prev",review_num); 
	}
	//좋아요
	public int like(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".review_likeNum",review_num);
	}
	//좋아요취소
	public int like1(int review_num) {
		return sqlSession.selectOne(NAMESPACE + ".reivew_likeNum",review_num);
	}
	public int updateReviewChk(int review_num) {
		return sqlSession.update(NAMESPACE + ".updateReviewChk", review_num);
	}
	public int reviewUpdate(ReviewVo vo) {
		return sqlSession.update(NAMESPACE +".reviewUpdate",vo);
	}
}