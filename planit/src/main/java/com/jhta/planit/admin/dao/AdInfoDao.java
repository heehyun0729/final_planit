package com.jhta.planit.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.admin.vo.AdInfoVo;

@Repository
public class AdInfoDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AdInfoMapper.";
	public int insert(AdInfoVo adInfoVo) {
		return sqlSession.insert(NAMESPACE + "insert", adInfoVo);
	}
	public int getRecentAdInfoNum() {
		return sqlSession.selectOne(NAMESPACE + "getRecentAdInfoNum");
	}	 
	public List<AdInfoVo> getChance(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "getChance", map);
	}
	public List<AdInfoVo> getTodayAd(String adInfo_date){
		return sqlSession.selectList(NAMESPACE + "getTodayAd", adInfo_date);
	}
	public List<AdInfoVo> getAdInfoInfo(int ad_num){
		return sqlSession.selectList(NAMESPACE + "getAdInfoInfo", ad_num);
	}
	public int adInfoApproved(int adInfo_num) {
		return sqlSession.update(NAMESPACE + "adInfoApproved", adInfo_num);
	}
	public int adInfoDeclined(int adInfo_num) {
		return sqlSession.update(NAMESPACE + "adInfoDeclined", adInfo_num);
	}
	public int adInfoRefunded(int adInfo_num) {
		return sqlSession.update(NAMESPACE + "adInfoRefunded", adInfo_num);
	}
	public int requestRefundAdInfo(int adInfo_num) {
		return sqlSession.update(NAMESPACE + "requestRefundAdInfo", adInfo_num);
	}
	public int requestRefundAllAdInfo(int ad_num) {
		return sqlSession.update(NAMESPACE + "requestRefundAllAdInfo", ad_num);
	}
	public AdInfoVo getAdInfo2(int adInfo_num) {
		return sqlSession.selectOne(NAMESPACE + "getAdInfo2", adInfo_num);
	}
	public int hitAdInfo(HashMap<String, Integer> map) {
		return sqlSession.update(NAMESPACE + "hitAdInfo", map);
	}
	public int clickAdInfo(HashMap<String, Integer> map) {
		return sqlSession.update(NAMESPACE + "clickAdInfo", map);
	}
}
