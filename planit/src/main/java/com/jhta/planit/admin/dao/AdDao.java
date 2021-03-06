package com.jhta.planit.admin.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdVo;

@Repository
public class AdDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdMapper.";
	public int insert(AdVo adVo) {
		return sqlSession.insert(NAMESPACE + "insert", adVo);
	}
	public int getRecentAdNum() {
		return sqlSession.selectOne(NAMESPACE + "getRecentAdNum");
	}
	public int getTotalRowCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + "getTotalRowCount", map);
	}
	public int getApproveAdBadge() {
		return sqlSession.selectOne(NAMESPACE + "getApproveAdBadge");
	}
	public int getRequestRefundAdBadge() {
		return sqlSession.selectOne(NAMESPACE + "getRequestRefundAdBadge");
	}
	public List<AdVo> getAdList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getAdList", map);
	}
	public List<AdVo> getMyAdList(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getMyAdList", map);
	}
	public AdVo getAdInfo(int ad_num) {
		return sqlSession.selectOne(NAMESPACE + "getAdInfo", ad_num);
	}
	public List<AdVo> getRecent5Ad(){
		return sqlSession.selectList(NAMESPACE + "getRecent5Ad");
	}
	public int approveAd(int ad_num) {
		return sqlSession.update(NAMESPACE + "approveAd", ad_num);
	}
	public int declineAd(int ad_num) {
		return sqlSession.update(NAMESPACE + "declineAd", ad_num);
	}
	public int partRefundedAd(int ad_num) {
		return sqlSession.update(NAMESPACE + "partRefundedAd", ad_num);
	}
	public int allRefundedAd(int ad_num) {
		return sqlSession.update(NAMESPACE + "allRefundedAd", ad_num);
	}
	public int requestRefundAd(int ad_num) {
		return sqlSession.update(NAMESPACE + "requestRefundAd", ad_num);
	}
	public int getTodayAdProfit(String ad_requestDate) {
		return sqlSession.selectOne(NAMESPACE + "getTodayAdProfit", ad_requestDate);
	}
}
