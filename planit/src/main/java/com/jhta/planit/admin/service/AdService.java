package com.jhta.planit.admin.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.jhta.planit.admin.dao.AdDao;
import com.jhta.planit.admin.dao.AdImageDao;
import com.jhta.planit.admin.dao.AdInfoDao;
import com.jhta.planit.admin.vo.AdImageVo;
import com.jhta.planit.admin.vo.AdInfoVo;
import com.jhta.planit.admin.vo.AdVo;

@Service
public class AdService {
	@Autowired
	private AdDao adDao;
	@Autowired
	private AdInfoDao adInfoDao;
	@Autowired
	private AdImageDao adImageDao;
	@Transactional
	public boolean insert(HashMap<String, Object> map) {//광고 신청
		AdVo adVo=(AdVo)map.get("adVo");
		adDao.insert(adVo);//ad테이블 DB정보 저장		
		
		String[] order=(String[])map.get("order");
		Date[] orderDate=(Date[])map.get("orderDate");
		int[] orderPrice=(int[])map.get("orderPrice");
		String adImg_orgImg=(String)map.get("adImg_orgImg");
		String adImg_savImg=(String)map.get("adImg_savImg");		
		int ad_num=0;
		try {
			ad_num=adDao.getRecentAdNum();
			
		}catch(Exception e) {
			ad_num=1;
		}		
		for(int i=0;i<order.length;i++) {
			int adInfo_chance=Integer.parseInt(order[i].split("%")[0]);
			Date adInfo_date=orderDate[i];
			int adInfo_price=orderPrice[i];
			AdInfoVo adInfoVo=new AdInfoVo(0, ad_num, adInfo_date, adInfo_chance, 0, 0, 0, adInfo_price);
			adInfoDao.insert(adInfoVo); //adInfo테이블 DB정보 저장
			int adInfo_num=adInfoDao.getRecentAdInfoNum();
			AdImageVo adImageVo=new AdImageVo(0, adInfo_num, adImg_orgImg, adImg_savImg, 0, null, null);
			adImageDao.insert(adImageVo);//adImage테이블 DB정보 저장
		}
		return true;
	}
	public int getRecentAdNum() {
		return adDao.getRecentAdNum();
	}	
	public List<AdInfoVo> getChance(HashMap<String, Object> map) {
		return adInfoDao.getChance(map);
	}
	public int getTotalRowCount(HashMap<String, Object> map) {
		return adDao.getTotalRowCount(map);
	}
	public int getAdImageTotalRowCount(HashMap<String, Object> map) {
		return adImageDao.getTotalRowCount(map);
	}
	public List<AdVo> getAdList(HashMap<String, Object> map) {
		return adDao.getAdList(map);
	}
	public List<AdVo> getMyAdList(HashMap<String, Object> map) {
		return adDao.getMyAdList(map);
	}
	public List<AdImageVo> getAdImageList(HashMap<String, Object> map) {
		return adImageDao.getAdImageList(map);
	}
	public List<AdInfoVo> getAdInfoInfo(int ad_num){
		return adInfoDao.getAdInfoInfo(ad_num);
	}
	public AdVo getAdInfo(int ad_num){
		return adDao.getAdInfo(ad_num);
	}
	public AdImageVo getAdInfoImage(int adInfo_num) {
		return adImageDao.getAdInfoImage(adInfo_num);
	}
	@Transactional
	public int approveAd(int ad_num) {//광고 승인
		adDao.approveAd(ad_num);
		List<AdInfoVo> getAdInfoInfo=adInfoDao.getAdInfoInfo(ad_num);
		for(AdInfoVo vo:getAdInfoInfo) {
			adInfoDao.adInfoApproved(vo.getAdInfo_num());
		}
		return 1;
	}
	@Transactional
	public int declineAd(int ad_num) {//광고 거절
		adDao.declineAd(ad_num);
		List<AdInfoVo> getAdInfoInfo=adInfoDao.getAdInfoInfo(ad_num);
		for(AdInfoVo vo:getAdInfoInfo) {
			adInfoDao.adInfoDeclined(vo.getAdInfo_num());
		}
		return 1;
	}
	@Transactional
	public int requestRefundAllAd(int ad_num) {//일괄 환불 요청
		adDao.requestRefundAd(ad_num);
		adInfoDao.requestRefundAllAdInfo(ad_num);
		return 1;
	}
	@Transactional
	public int requestRefundPartAd(int ad_num, int adInfo_num) {//부분 환불 요청
		adDao.requestRefundAd(ad_num);
		adInfoDao.requestRefundAdInfo(adInfo_num);
		return 1;
	}
	public int refundedAd(int adInfo_num) {//부분 광고 환불
		return adInfoDao.adInfoRefunded(adInfo_num);
	}
	public int adInfoDeclined(int adInfo_num) {//부분 광고 개제 중단
		return adInfoDao.adInfoDeclined(adInfo_num);
	}
	public int partRefundedAd(int ad_num) {//ad테이블 부분환불 표시
		return adDao.partRefundedAd(ad_num);
	}
	@Transactional
	public int refundAllAd(int ad_num) {//모든 광고 환불
		adDao.allRefundedAd(ad_num);
		List<AdInfoVo> getAdInfoInfo=adInfoDao.getAdInfoInfo(ad_num);
		for(AdInfoVo vo:getAdInfoInfo) {
			adInfoDao.adInfoRefunded(vo.getAdInfo_num());
		}
		return 1;
	}
	public int allRefundedAd(int ad_num) {//ad테이블 완전환불 표시
		return adDao.allRefundedAd(ad_num);
	}
	public HashMap<String, Integer> getAdBadges(){//뱃지 얻기
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int approveAdBadge=adDao.getApproveAdBadge();
		int requestRefundAdBadge=adDao.getRequestRefundAdBadge();
		int requestChangeAdImageBadge=adImageDao.getRequestChangeAdImageBadge();
		map.put("approveAdBadge", approveAdBadge);
		map.put("requestRefundAdBadge", requestRefundAdBadge);
		map.put("requestChangeAdImageBadge", requestChangeAdImageBadge);
		return map;
	}
	public AdImageVo getRequestChangeAdInfoImage(int adImg_num) {//이미지번호로 정보 얻기
		return adImageDao.getRequestChangeAdInfoImage(adImg_num);
	}
	public int requestChangeAdImage(HashMap<String, String> map) {//광고 이미지 변경 신청
		return adImageDao.requestChangeAdImage(map);
	}
	public int requestChangeAdImageApprove(HashMap<String, String> map) {//광고 이미지 변경 승인
		return adImageDao.requestChangeAdImageApprove(map);
	}
	public int requestChangeAdImageDecline(int adImg_num) {//광고 이미지 변경 거절
		return adImageDao.requestChangeAdImageDecline(adImg_num);
	}
	public List<AdInfoVo> getTodayAd(String adInfo_date){//오늘 광고 리스트
		return adInfoDao.getTodayAd(adInfo_date);
	}
	public AdInfoVo getAdInfo2(int adInfo_num) {
		return adInfoDao.getAdInfo2(adInfo_num);
	}
	@Transactional
	public void showAd(Model model) {//광고 출력
		Date date=new Date(System.currentTimeMillis());
		String adInfo_date=date.toString();
		List<AdInfoVo> getTodayAd=adInfoDao.getTodayAd(adInfo_date);
		ArrayList<AdImageVo> imageList=new ArrayList<AdImageVo>();
		ArrayList<Integer> chanceList=new ArrayList<Integer>();
		for(int i=0;i<getTodayAd.size();i++) {
			int adInfo_num=getTodayAd.get(i).getAdInfo_num();
			AdImageVo vo=adImageDao.getAdInfoImage(adInfo_num);
			imageList.add(vo);
			AdInfoVo vo2=adInfoDao.getAdInfo2(adInfo_num);
			int chance=vo2.getAdInfo_chance()*100;
			chanceList.add(chance);
			int adInfo_hit=vo2.getAdInfo_hit()+1;
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			map.put("adInfo_num", adInfo_num);
			map.put("adInfo_hit", adInfo_hit);
			adInfoDao.hitAdInfo(map);
		}
		model.addAttribute("chanceList", chanceList );
		model.addAttribute("imageList", imageList);
	}
	public void clickAd(int adInfo_num, Model model) {
		AdInfoVo vo2=adInfoDao.getAdInfo2(adInfo_num);
		int ad_num=vo2.getAd_num();
		AdVo vo3=adDao.getAdInfo(ad_num);
		int adInfo_click=vo2.getAdInfo_click()+1;
		String url=vo3.getAd_url();		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("adInfo_num", adInfo_num);
		map.put("adInfo_click", adInfo_click);
		adInfoDao.clickAdInfo(map);
		model.addAttribute("url", url);
	}
}
