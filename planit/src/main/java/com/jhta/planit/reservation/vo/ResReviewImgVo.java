package com.jhta.planit.reservation.vo;

public class ResReviewImgVo {
	private int resReviewImg_num;
	private String resReviewImg_orgImg;
	private String resReviewImg_saveImg;
	
	public ResReviewImgVo() {}

	public ResReviewImgVo(int resReviewImg_num, String resReviewImg_orgImg, String resReviewImg_saveImg) {
		super();
		this.resReviewImg_num = resReviewImg_num;
		this.resReviewImg_orgImg = resReviewImg_orgImg;
		this.resReviewImg_saveImg = resReviewImg_saveImg;
	}

	public int getResReviewImg_num() {
		return resReviewImg_num;
	}

	public void setResReviewImg_num(int resReviewImg_num) {
		this.resReviewImg_num = resReviewImg_num;
	}

	public String getResReviewImg_orgImg() {
		return resReviewImg_orgImg;
	}

	public void setResReviewImg_orgImg(String resReviewImg_orgImg) {
		this.resReviewImg_orgImg = resReviewImg_orgImg;
	}

	public String getResReviewImg_saveImg() {
		return resReviewImg_saveImg;
	}

	public void setResReviewImg_saveImg(String resReviewImg_saveImg) {
		this.resReviewImg_saveImg = resReviewImg_saveImg;
	}
	
	
}
