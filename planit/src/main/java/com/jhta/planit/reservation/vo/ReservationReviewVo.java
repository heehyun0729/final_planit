package com.jhta.planit.reservation.vo;

import java.sql.Date;

public class ReservationReviewVo {
	private int resReview_num;
	private String resReview_content;
	private Date resReview_date;
	private int resReview_star;
	private int resReview_like;
	
	public ReservationReviewVo() {}

	public ReservationReviewVo(int resReview_num, String resReview_content, Date resReview_date, int resReview_star,
			int resReview_like) {
		super();
		this.resReview_num = resReview_num;
		this.resReview_content = resReview_content;
		this.resReview_date = resReview_date;
		this.resReview_star = resReview_star;
		this.resReview_like = resReview_like;
	}

	public int getResReview_num() {
		return resReview_num;
	}

	public void setResReview_num(int resReview_num) {
		this.resReview_num = resReview_num;
	}

	public String getResReview_content() {
		return resReview_content;
	}

	public void setResReview_content(String resReview_content) {
		this.resReview_content = resReview_content;
	}

	public Date getResReview_date() {
		return resReview_date;
	}

	public void setResReview_date(Date resReview_date) {
		this.resReview_date = resReview_date;
	}

	public int getResReview_star() {
		return resReview_star;
	}

	public void setResReview_star(int resReview_star) {
		this.resReview_star = resReview_star;
	}

	public int getResReview_like() {
		return resReview_like;
	}

	public void setResReview_like(int resReview_like) {
		this.resReview_like = resReview_like;
	}
	
	
}
