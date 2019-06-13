package com.jhta.planit.review.vo;

public class ReviewImageVo {
	private int reviewImge_num;
	private int review_num;
	private String reviewImge_orgImg;
	private String reviewImge_saveImg;
	private int reviewImageChk;
	public ReviewImageVo() {}
	
	public ReviewImageVo(int reviewImge_num, int review_num, String reviewImge_orgImg, String reviewImge_saveImg,
			int reviewImageChk) {
		super();
		this.reviewImge_num = reviewImge_num;
		this.review_num = review_num;
		this.reviewImge_orgImg = reviewImge_orgImg;
		this.reviewImge_saveImg = reviewImge_saveImg;
		this.reviewImageChk = reviewImageChk;
	}
	public int getReviewImge_num() {
		return reviewImge_num;
	}
	public void setReviewImge_num(int reviewImge_num) {
		this.reviewImge_num = reviewImge_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReviewImge_orgImg() {
		return reviewImge_orgImg;
	}
	public void setReviewImge_orgImg(String reviewImge_orgImg) {
		this.reviewImge_orgImg = reviewImge_orgImg;
	}
	public String getReviewImge_saveImg() {
		return reviewImge_saveImg;
	}
	public void setReviewImge_saveImg(String reviewImge_saveImg) {
		this.reviewImge_saveImg = reviewImge_saveImg;
	}
	public int getReviewImageChk() {
		return reviewImageChk;
	}
	public void setReviewImageChk(int reviewImageChk) {
		this.reviewImageChk = reviewImageChk;
	}

	

	
}