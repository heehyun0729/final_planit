package com.jhta.planit.admin.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdImageVo;

@Repository
public class AdImageDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdImageMapper.";
	public int insert(AdImageVo adImageVo) {
		return sqlSession.insert(NAMESPACE + "insert", adImageVo);
	}
	public int getTotalRowCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + "getTotalRowCount", map);
	}
	public List<AdImageVo> getAdImageList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getAdImageList", map);
	}
	public AdImageVo getAdInfoImage(int adInfo_num) {
		return sqlSession.selectOne(NAMESPACE + "getAdInfoImage", adInfo_num);
	}
	public AdImageVo getRequestChangeAdInfoImage(int adImg_num) {
		return sqlSession.selectOne(NAMESPACE + "getRequestChangeAdInfoImage", adImg_num);
	}
	public int requestChangeAdImage(HashMap<String, String> map) {
		return sqlSession.update(NAMESPACE + "requestChangeAdImage", map);
	}
	public int getRequestChangeAdImageBadge() {
		return sqlSession.selectOne(NAMESPACE + "getRequestChangeAdImageBadge");
	}
	public int requestChangeAdImageApprove(HashMap<String, String> map) {
		return sqlSession.update(NAMESPACE + "requestChangeAdImageApprove", map);
	}
	public int requestChangeAdImageDecline(int adImg_num) {
		return sqlSession.update(NAMESPACE + "requestChangeAdImageDecline", adImg_num);
	}
}
