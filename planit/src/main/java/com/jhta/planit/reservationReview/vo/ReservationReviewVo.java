package com.jhta.planit.reservationReview.vo;

import java.sql.Date;

public class ReservationReviewVo {
	private int resReview_num;
	private String mem_id;
	private int rsvn_num;
	private String resReview_title;
	private String resReview_content;
	private Date resReview_data;
	private int resReview_star;
	private int resReview_Chk;
	
	public ReservationReviewVo() {}

	public ReservationReviewVo(int resReview_num, String mem_id, int rsvn_num, String resReview_title,
			String resReview_content, Date resReview_data, int resReview_star, int resReview_Chk) {
		super();
		this.resReview_num = resReview_num;
		this.mem_id = mem_id;
		this.rsvn_num = rsvn_num;
		this.resReview_title = resReview_title;
		this.resReview_content = resReview_content;
		this.resReview_data = resReview_data;
		this.resReview_star = resReview_star;
		this.resReview_Chk = resReview_Chk;
	}

	public int getResReview_num() {
		return resReview_num;
	}

	public void setResReview_num(int resReview_num) {
		this.resReview_num = resReview_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getRsvn_num() {
		return rsvn_num;
	}

	public void setRsvn_num(int rsvn_num) {
		this.rsvn_num = rsvn_num;
	}

	public String getResReview_title() {
		return resReview_title;
	}

	public void setResReview_title(String resReview_title) {
		this.resReview_title = resReview_title;
	}

	public String getResReview_content() {
		return resReview_content;
	}

	public void setResReview_content(String resReview_content) {
		this.resReview_content = resReview_content;
	}

	public Date getResReview_data() {
		return resReview_data;
	}

	public void setResReview_data(Date resReview_data) {
		this.resReview_data = resReview_data;
	}

	public int getResReview_star() {
		return resReview_star;
	}

	public void setResReview_star(int resReview_star) {
		this.resReview_star = resReview_star;
	}

	public int getResReview_Chk() {
		return resReview_Chk;
	}

	public void setResReview_Chk(int resReview_Chk) {
		this.resReview_Chk = resReview_Chk;
	}

	@Override
	public String toString() {
		return "ReservationReviewVo [resReview_num=" + resReview_num + ", mem_id=" + mem_id + ", rsvn_num=" + rsvn_num
				+ ", resReview_title=" + resReview_title + ", resReview_content=" + resReview_content
				+ ", resReview_data=" + resReview_data + ", resReview_star=" + resReview_star + ", resReview_Chk="
				+ resReview_Chk + "]";
	}

	
	
}
