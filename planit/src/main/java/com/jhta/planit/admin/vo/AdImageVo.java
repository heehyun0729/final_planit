package com.jhta.planit.admin.vo;

public class AdImageVo {
	private int adImg_num;
	private int adInfo_num;
	private String adImg_orgImg;
	private String adImg_saveImg;
	public AdImageVo() {}
	public AdImageVo(int adImg_num, int adInfo_num, String adImg_orgImg, String adImg_saveImg) {
		super();
		this.adImg_num = adImg_num;
		this.adInfo_num = adInfo_num;
		this.adImg_orgImg = adImg_orgImg;
		this.adImg_saveImg = adImg_saveImg;
	}
	public int getAdImg_num() {
		return adImg_num;
	}
	public void setAdImg_num(int adImg_num) {
		this.adImg_num = adImg_num;
	}
	public int getAdInfo_num() {
		return adInfo_num;
	}
	public void setAdInfo_num(int adInfo_num) {
		this.adInfo_num = adInfo_num;
	}
	public String getAdImg_orgImg() {
		return adImg_orgImg;
	}
	public void setAdImg_orgImg(String adImg_orgImg) {
		this.adImg_orgImg = adImg_orgImg;
	}
	public String getAdImg_saveImg() {
		return adImg_saveImg;
	}
	public void setAdImg_saveImg(String adImg_saveImg) {
		this.adImg_saveImg = adImg_saveImg;
	}
	@Override
	public String toString() {
		return "AdImageVo [adImg_num=" + adImg_num + ", adInfo_num=" + adInfo_num + ", adImg_orgImg=" + adImg_orgImg
				+ ", adImg_saveImg=" + adImg_saveImg + "]";
	}
	
	
}
