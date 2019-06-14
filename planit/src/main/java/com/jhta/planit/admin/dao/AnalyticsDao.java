package com.jhta.planit.admin.dao;


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
	public int getRooms(){//�� ��ϵ� ���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getRooms");
	}
	public int getPaidRooms(){//����� ���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getPaidRooms");
	}
	public int todaySellProfit(){//���� ���� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "todaySellProfit");
	}
	public int getDaySellProfit(String rsvnPay_date) {//�ش� �� ������� ���ϱ�
		return sqlSession.selectOne(NAMESPACE + "getDaySellProfit", rsvnPay_date);
	}
	public List<RsvnPayVo> getRecent5Sell(){//�ֱ� 5�� ���� �ŷ� ���� ���ϱ�
		return sqlSession.selectList(NAMESPACE + "getRecent5Sell");
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
