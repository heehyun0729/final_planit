package com.jhta.planit.admin.vo;

import java.sql.Date;

public class AdInfoVo {
	private int adInfo_num;
	private int ad_num;
	private Date adInfo_date;
	private int adInfo_chance;
	private int adInfo_hit;
	private int adInfo_click;
	private int adInfo_status;
	private int adInfo_price;
	public AdInfoVo() {}
	public AdInfoVo(int adInfo_num, int ad_num, Date adInfo_date, int adInfo_chance, int adInfo_hit, int adInfo_click,
			int adInfo_status, int adInfo_price) {
		super();
		this.adInfo_num = adInfo_num;
		this.ad_num = ad_num;
		this.adInfo_date = adInfo_date;
		this.adInfo_chance = adInfo_chance;
		this.adInfo_hit = adInfo_hit;
		this.adInfo_click = adInfo_click;
		this.adInfo_status = adInfo_status;
		this.adInfo_price = adInfo_price;
	}
	public int getAdInfo_num() {
		return adInfo_num;
	}
	public void setAdInfo_num(int adInfo_num) {
		this.adInfo_num = adInfo_num;
	}
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public Date getAdInfo_date() {
		return adInfo_date;
	}
	public void setAdInfo_date(Date adInfo_date) {
		this.adInfo_date = adInfo_date;
	}
	public int getAdInfo_chance() {
		return adInfo_chance;
	}
	public void setAdInfo_chance(int adInfo_chance) {
		this.adInfo_chance = adInfo_chance;
	}
	public int getAdInfo_hit() {
		return adInfo_hit;
	}
	public void setAdInfo_hit(int adInfo_hit) {
		this.adInfo_hit = adInfo_hit;
	}
	public int getAdInfo_click() {
		return adInfo_click;
	}
	public void setAdInfo_click(int adInfo_click) {
		this.adInfo_click = adInfo_click;
	}
	public int getAdInfo_status() {
		return adInfo_status;
	}
	public void setAdInfo_status(int adInfo_status) {
		this.adInfo_status = adInfo_status;
	}
	public int getAdInfo_price() {
		return adInfo_price;
	}
	public void setAdInfo_price(int adInfo_price) {
		this.adInfo_price = adInfo_price;
	}
	@Override
	public String toString() {
		return "AdInfoVo [adInfo_num=" + adInfo_num + ", ad_num=" + ad_num + ", adInfo_date=" + adInfo_date
				+ ", adInfo_chance=" + adInfo_chance + ", adInfo_hit=" + adInfo_hit + ", adInfo_click=" + adInfo_click
				+ ", adInfo_status=" + adInfo_status + ", adInfo_price=" + adInfo_price + "]";
	}
	
}
