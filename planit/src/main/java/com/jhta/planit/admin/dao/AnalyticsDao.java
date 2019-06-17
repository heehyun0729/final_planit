package com.jhta.planit.admin.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.planit.reservation.vo.RsvnPayVo;
import com.jhta.planit.reservation.vo.RsvnVo;

@Repository
public class AnalyticsDao {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.jhta.planit.mybatis.AnalyticsMapper.";
	public List<Object> getPlanedCountry(){//플래너 국가 순위 차트
		return sqlSession.selectList(NAMESPACE + "getPlanedCountry");
	}
	public List<Object> getBuddyCountry(){//동행 국가 순위 차트
		return sqlSession.selectList(NAMESPACE + "getBuddyCountry");
	}
	public List<Object> getMembersGender(){//회원 성별 차트
		return sqlSession.selectList(NAMESPACE + "getMembersGender");
	}
	public List<Object> getMembersBirthYear(){//회원 생일 분포 차트
		return sqlSession.selectList(NAMESPACE + "getMembersBirthYear");
	}
	public double getAllRoomsCount(){//총 등록된 방의 갯수 구하기
		return sqlSession.selectOne(NAMESPACE + "getAllRoomsCount");
	}
	public double getAllPaidRoomsCount(){//예약된 모든 방의 갯수 구하기
		return sqlSession.selectOne(NAMESPACE + "getAllPaidRoomsCount");
	}
	public double getPaidRoomsCount(String mem_id){//예약된 방의 갯수 아이디로 구하기
		return sqlSession.selectOne(NAMESPACE + "getPaidRoomsCount", mem_id);
	}
	public double getRoomsCount(String mem_id){//등록된 방의 갯수 아이디로 구하기
		return sqlSession.selectOne(NAMESPACE + "getRoomsCount", mem_id);
	}
	public int todaySellProfit(){//금일 예약 수익 구하기
		return sqlSession.selectOne(NAMESPACE + "todaySellProfit");
	}
	public int getDaySellProfit(String rsvnPay_date) {//해당 일 예약수익 구하기
		return sqlSession.selectOne(NAMESPACE + "getDaySellProfit", rsvnPay_date);
	}
	public int todaySellerSellProfit(String mem_id){//판매자 금일 예약 수익 구하기
		return sqlSession.selectOne(NAMESPACE + "todaySellerSellProfit", mem_id);
	}
	public int getDaySellerSellProfit(HashMap<String, String> map) {//판매자 해당 일 예약수익 구하기
		return sqlSession.selectOne(NAMESPACE + "getDaySellerSellProfit", map);
	}
	public List<RsvnPayVo> getRecent5Sell(){//최근 5건 예약 거래 내역 구하기
		return sqlSession.selectList(NAMESPACE + "getRecent5Sell");
	}
	public List<Object> getSellerRecent5Sell(String mem_id){//판매자 최근 5건 예약 거래 내역 구하기
		return sqlSession.selectList(NAMESPACE + "getSellerRecent5Sell", mem_id);
	}
	public RsvnVo getRsvnInfo(int rsvn_num){//예약 번호로 정보 구하기
		return sqlSession.selectOne(NAMESPACE + "getRsvnInfo", rsvn_num);
	}
	public int getDayAdHit(String rsvnPay_date){//해당 일 광고 조회수 구하기
		return sqlSession.selectOne(NAMESPACE + "getDayAdHit", rsvnPay_date);
	}
	public int getDayAdClick(String rsvnPay_date){//해당 일 광고 클릭수 구하기
		return sqlSession.selectOne(NAMESPACE + "getDayAdClick", rsvnPay_date);
	}
}
