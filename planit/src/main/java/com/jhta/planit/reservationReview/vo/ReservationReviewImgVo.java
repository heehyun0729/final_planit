package com.jhta.planit.reservationReview.vo;

public class ReservationReviewImgVo {
	private int resReviewImg_num;
	private int resReview_num;
	private String resReviewImg_orgImg;
	private String resReviewImg_saveImg;
	private int resRviewImg_Chk;
	
	public ReservationReviewImgVo() {}

	public ReservationReviewImgVo(int resReviewImg_num, int resReview_num, String resReviewImg_orgImg,
			String resReviewImg_saveImg, int resRviewImg_Chk) {
		super();
		this.resReviewImg_num = resReviewImg_num;
		this.resReview_num = resReview_num;
		this.resReviewImg_orgImg = resReviewImg_orgImg;
		this.resReviewImg_saveImg = resReviewImg_saveImg;
		this.resRviewImg_Chk = resRviewImg_Chk;
	}

	public int getResReviewImg_num() {
		return resReviewImg_num;
	}

	public void setResReviewImg_num(int resReviewImg_num) {
		this.resReviewImg_num = resReviewImg_num;
	}

	public int getResReview_num() {
		return resReview_num;
	}

	public void setResReview_num(int resReview_num) {
		this.resReview_num = resReview_num;
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

	public int getResRviewImg_Chk() {
		return resRviewImg_Chk;
	}

	public void setResRviewImg_Chk(int resRviewImg_Chk) {
		this.resRviewImg_Chk = resRviewImg_Chk;
	}

	
	
}
