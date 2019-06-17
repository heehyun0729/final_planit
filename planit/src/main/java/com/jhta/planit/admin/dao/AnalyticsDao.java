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
	public List<Object> getPlanedCountry(){//�÷��� ���� ���� ��Ʈ
		return sqlSession.selectList(NAMESPACE + "getPlanedCountry");
	}
	public List<Object> getBuddyCountry(){//���� ���� ���� ��Ʈ
		return sqlSession.selectList(NAMESPACE + "getBuddyCountry");
	}
	public List<Object> getMembersGender(){//ȸ�� ���� ��Ʈ
		return sqlSession.selectList(NAMESPACE + "getMembersGender");
	}
	public List<Object> getMembersBirthYear(){//ȸ�� ���� ���� ��Ʈ
		return sqlSession.selectList(NAMESPACE + "getMembersBirthYear");
	}
	public double getAllRoomsCount(){//�� ��ϵ� ���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getAllRoomsCount");
	}
	public double getAllPaidRoomsCount(){//����� ��� ���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getAllPaidRoomsCount");
	}
	public double getPaidRoomsCount(String mem_id){//����� ���� ���� ���̵�� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getPaidRoomsCount", mem_id);
	}
	public double getRoomsCount(String mem_id){//��ϵ� ���� ���� ���̵�� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getRoomsCount", mem_id);
	}
	public int todaySellProfit(){//���� ���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "todaySellProfit");
	}
	public int getDaySellProfit(String rsvnPay_date) {//�ش� �� ������� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getDaySellProfit", rsvnPay_date);
	}
	public int todaySellerSellProfit(String mem_id){//�Ǹ��� ���� ���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "todaySellerSellProfit", mem_id);
	}
	public int getDaySellerSellProfit(HashMap<String, String> map) {//�Ǹ��� �ش� �� ������� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getDaySellerSellProfit", map);
	}
	public List<RsvnPayVo> getRecent5Sell(){//�ֱ� 5�� ���� �ŷ� ���� ���ϱ�
		return sqlSession.selectList(NAMESPACE + "getRecent5Sell");
	}
	public List<Object> getSellerRecent5Sell(String mem_id){//�Ǹ��� �ֱ� 5�� ���� �ŷ� ���� ���ϱ�
		return sqlSession.selectList(NAMESPACE + "getSellerRecent5Sell", mem_id);
	}
	public RsvnVo getRsvnInfo(int rsvn_num){//���� ��ȣ�� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getRsvnInfo", rsvn_num);
	}
	public int getDayAdHit(String rsvnPay_date){//�ش� �� ���� ��ȸ�� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getDayAdHit", rsvnPay_date);
	}
	public int getDayAdClick(String rsvnPay_date){//�ش� �� ���� Ŭ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getDayAdClick", rsvnPay_date);
	}
}
