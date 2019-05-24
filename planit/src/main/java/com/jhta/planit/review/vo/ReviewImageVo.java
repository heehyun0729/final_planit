package com.jhta.planit.review.vo;

public class ReviewImageVo {
	private int reviewImage;
	private String reviewImg_orgImg;
	private String reviewImg_saveImg;
	
	public ReviewImageVo() {}

	public ReviewImageVo(int reviewImage, String reviewImg_orgImg, String reviewImg_saveImg) {
		super();
		this.reviewImage = reviewImage;
		this.reviewImg_orgImg = reviewImg_orgImg;
		this.reviewImg_saveImg = reviewImg_saveImg;
	}

	public int getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(int reviewImage) {
		this.reviewImage = reviewImage;
	}

	public String getReviewImg_orgImg() {
		return reviewImg_orgImg;
	}

	public void setReviewImg_orgImg(String reviewImg_orgImg) {
		this.reviewImg_orgImg = reviewImg_orgImg;
	}

	public String getReviewImg_saveImg() {
		return reviewImg_saveImg;
	}

	public void setReviewImg_saveImg(String reviewImg_saveImg) {
		this.reviewImg_saveImg = reviewImg_saveImg;
	}
	
	
}
