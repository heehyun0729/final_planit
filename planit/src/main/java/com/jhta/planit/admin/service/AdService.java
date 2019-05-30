package com.jhta.planit.admin.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	public boolean insert(HashMap<String, Object> map) {
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
			System.out.println(adInfoVo);
			adInfoDao.insert(adInfoVo); //adInfo테이블 DB정보 저장
			int adInfo_num=adInfoDao.getRecentAdInfoNum();
			AdImageVo adImageVo=new AdImageVo(0, adInfo_num, adImg_orgImg, adImg_savImg);
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
}
