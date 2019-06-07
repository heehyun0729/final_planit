package com.jhta.planit.review.vo;

import java.sql.Date;

public class ReviewJoinVo {
	private int review_num;
	private String mem_id;
	private String review_country;
	private String review_city;
	private String review_title;
	private String review_content;
	private Date review_date;
	private int review_hit;
	private int review_star;
	private int review_like;
	private int reviewImage_num;
	private String reviewImge_orgImg;
	private String reviewImge_saveImg;
	
	public ReviewJoinVo() {}

	public ReviewJoinVo(int review_num, String mem_id, String review_country, String review_city, String review_title,
			String review_content, Date review_date, int review_hit, int review_star, int review_like,
			int reviewImage_num, String reviewImge_orgImg, String reviewImge_saveImg) {
		super();
		this.review_num = review_num;
		this.mem_id = mem_id;
		this.review_country = review_country;
		this.review_city = review_city;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_date = review_date;
		this.review_hit = review_hit;
		this.review_star = review_star;
		this.review_like = review_like;
		this.reviewImage_num = reviewImage_num;
		this.reviewImge_orgImg = reviewImge_orgImg;
		this.reviewImge_saveImg = reviewImge_saveImg;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getReview_country() {
		return review_country;
	}

	public void setReview_country(String review_country) {
		this.review_country = review_country;
	}

	public String getReview_city() {
		return review_city;
	}

	public void setReview_city(String review_city) {
		this.review_city = review_city;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_hit() {
		return review_hit;
	}

	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}

	public int getReview_star() {
		return review_star;
	}

	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	public int getReviewImage_num() {
		return reviewImage_num;
	}

	public void setReviewImage_num(int reviewImage_num) {
		this.reviewImage_num = reviewImage_num;
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

	
}