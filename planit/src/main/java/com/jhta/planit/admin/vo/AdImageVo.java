package com.jhta.planit.admin.vo;

public class AdImageVo {
	private int adImg_num;
	private int adInfo_num;
	private String adImg_orgImg;
	private String adImg_saveImg;
	private int adImg_status;
	private String adImg_changeOrgImg;
	private String adImg_changeSaveImg;
	public AdImageVo() {}
	public AdImageVo(int adImg_num, int adInfo_num, String adImg_orgImg, String adImg_saveImg, int adImg_status,
			String adImg_changeOrgImg, String adImg_changeSaveImg) {
		super();
		this.adImg_num = adImg_num;
		this.adInfo_num = adInfo_num;
		this.adImg_orgImg = adImg_orgImg;
		this.adImg_saveImg = adImg_saveImg;
		this.adImg_status = adImg_status;
		this.adImg_changeOrgImg = adImg_changeOrgImg;
		this.adImg_changeSaveImg = adImg_changeSaveImg;
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
	public int getAdImg_status() {
		return adImg_status;
	}
	public void setAdImg_status(int adImg_status) {
		this.adImg_status = adImg_status;
	}
	public String getAdImg_changeOrgImg() {
		return adImg_changeOrgImg;
	}
	public void setAdImg_changeOrgImg(String adImg_changeOrgImg) {
		this.adImg_changeOrgImg = adImg_changeOrgImg;
	}
	public String getAdImg_changeSaveImg() {
		return adImg_changeSaveImg;
	}
	public void setAdImg_changeSaveImg(String adImg_changeSaveImg) {
		this.adImg_changeSaveImg = adImg_changeSaveImg;
	}
	@Override
	public String toString() {
		return "AdImageVo [adImg_num=" + adImg_num + ", adInfo_num=" + adInfo_num + ", adImg_orgImg=" + adImg_orgImg
				+ ", adImg_saveImg=" + adImg_saveImg + ", adImg_status=" + adImg_status + ", adImg_changeOrgImg="
				+ adImg_changeOrgImg + ", adImg_changeSaveImg=" + adImg_changeSaveImg + "]";
	}
	
}
