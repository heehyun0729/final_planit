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
	public boolean insert(HashMap<String, Object> map) {//���� ��û
		AdVo adVo=(AdVo)map.get("adVo");
		adDao.insert(adVo);//ad���̺� DB���� ����		
		
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
			adInfoDao.insert(adInfoVo); //adInfo���̺� DB���� ����
			int adInfo_num=adInfoDao.getRecentAdInfoNum();
			AdImageVo adImageVo=new AdImageVo(0, adInfo_num, adImg_orgImg, adImg_savImg, 0, null, null);
			adImageDao.insert(adImageVo);//adImage���̺� DB���� ����
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
	public int approveAd(int ad_num) {//���� ����
		adDao.approveAd(ad_num);
		List<AdInfoVo> getAdInfoInfo=adInfoDao.getAdInfoInfo(ad_num);
		for(AdInfoVo vo:getAdInfoInfo) {
			adInfoDao.adInfoApproved(vo.getAdInfo_num());
		}
		return 1;
	}
	@Transactional
	public int declineAd(int ad_num) {//���� ����
		adDao.declineAd(ad_num);
		List<AdInfoVo> getAdInfoInfo=adInfoDao.getAdInfoInfo(ad_num);
		for(AdInfoVo vo:getAdInfoInfo) {
			adInfoDao.adInfoDeclined(vo.getAdInfo_num());
		}
		return 1;
	}
	@Transactional
	public int requestRefundAllAd(int ad_num) {//�ϰ� ȯ�� ��û
		adDao.requestRefundAd(ad_num);
		adInfoDao.requestRefundAllAdInfo(ad_num);
		return 1;
	}
	@Transactional
	public int requestRefundPartAd(int ad_num, int adInfo_num) {//�κ� ȯ�� ��û
		adDao.requestRefundAd(ad_num);
		adInfoDao.requestRefundAdInfo(adInfo_num);
		return 1;
	}
	public int refundedAd(int adInfo_num) {//�κ� ���� ȯ��
		return adInfoDao.adInfoRefunded(adInfo_num);
	}
	public int adInfoDeclined(int adInfo_num) {//�κ� ���� ���� �ߴ�
		return adInfoDao.adInfoDeclined(adInfo_num);
	}
	public int partRefundedAd(int ad_num) {//ad���̺� �κ�ȯ�� ǥ��
		return adDao.partRefundedAd(ad_num);
	}
	@Transactional
	public int refundAllAd(int ad_num) {//��� ���� ȯ��
		adDao.allRefundedAd(ad_num);
		List<AdInfoVo> getAdInfoInfo=adInfoDao.getAdInfoInfo(ad_num);
		for(AdInfoVo vo:getAdInfoInfo) {
			adInfoDao.adInfoRefunded(vo.getAdInfo_num());
		}
		return 1;
	}
	public int allRefundedAd(int ad_num) {//ad���̺� ����ȯ�� ǥ��
		return adDao.allRefundedAd(ad_num);
	}
	public HashMap<String, Integer> getAdBadges(){//���� ���
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		int approveAdBadge=adDao.getApproveAdBadge();
		int requestRefundAdBadge=adDao.getRequestRefundAdBadge();
		int requestChangeAdImageBadge=adImageDao.getRequestChangeAdImageBadge();
		map.put("approveAdBadge", approveAdBadge);
		map.put("requestRefundAdBadge", requestRefundAdBadge);
		map.put("requestChangeAdImageBadge", requestChangeAdImageBadge);
		return map;
	}
	public AdImageVo getRequestChangeAdInfoImage(int adImg_num) {//�̹�����ȣ�� ���� ���
		return adImageDao.getRequestChangeAdInfoImage(adImg_num);
	}
	public int requestChangeAdImage(HashMap<String, String> map) {//���� �̹��� ���� ��û
		return adImageDao.requestChangeAdImage(map);
	}
	public int requestChangeAdImageApprove(HashMap<String, String> map) {//���� �̹��� ���� ����
		return adImageDao.requestChangeAdImageApprove(map);
	}
	public int requestChangeAdImageDecline(int adImg_num) {//���� �̹��� ���� ����
		return adImageDao.requestChangeAdImageDecline(adImg_num);
	}
	public List<AdInfoVo> getTodayAd(String adInfo_date){//���� ���� ����Ʈ
		return adInfoDao.getTodayAd(adInfo_date);
	}
	public AdInfoVo getAdInfo2(int adInfo_num) {
		return adInfoDao.getAdInfo2(adInfo_num);
	}
	@Transactional
	public void showAd(Model model) {//���� ���
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
