package com.jhta.planit.admin.vo;

public class AdImageVo {
	private int adImg_num;
	private int ad_num;
	private String adImg_orgImg;
	private String adImg_savImg;
	public AdImageVo() {}
	public AdImageVo(int adImg_num, int ad_num, String adImg_orgImg, String adImg_savImg) {
		super();
		this.adImg_num = adImg_num;
		this.ad_num = ad_num;
		this.adImg_orgImg = adImg_orgImg;
		this.adImg_savImg = adImg_savImg;
	}
	public int getAdImg_num() {
		return adImg_num;
	}
	public void setAdImg_num(int adImg_num) {
		this.adImg_num = adImg_num;
	}
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public String getAdImg_orgImg() {
		return adImg_orgImg;
	}
	public void setAdImg_orgImg(String adImg_orgImg) {
		this.adImg_orgImg = adImg_orgImg;
	}
	public String getAdImg_savImg() {
		return adImg_savImg;
	}
	public void setAdImg_savImg(String adImg_savImg) {
		this.adImg_savImg = adImg_savImg;
	}
	@Override
	public String toString() {
		return "AdImageVo [adImg_num=" + adImg_num + ", ad_num=" + ad_num + ", adImg_orgImg=" + adImg_orgImg
				+ ", adImg_savImg=" + adImg_savImg + "]";
	}
	
}
