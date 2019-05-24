package com.jhta.planit.review.vo;

import java.sql.Date;

public class ReviewCommVo {
	private int rcomm_num;
	private String rcomm_content;
	private Date rcomm_date;
	private int rcomm_step;
	private int rcomm_ref;
	private int rcomm_lev;
	
	public ReviewCommVo() {}

	public ReviewCommVo(int rcomm_num, String rcomm_content, Date rcomm_date, int rcomm_step, int rcomm_ref,
			int rcomm_lev) {
		super();
		this.rcomm_num = rcomm_num;
		this.rcomm_content = rcomm_content;
		this.rcomm_date = rcomm_date;
		this.rcomm_step = rcomm_step;
		this.rcomm_ref = rcomm_ref;
		this.rcomm_lev = rcomm_lev;
	}

	public int getRcomm_num() {
		return rcomm_num;
	}

	public void setRcomm_num(int rcomm_num) {
		this.rcomm_num = rcomm_num;
	}

	public String getRcomm_content() {
		return rcomm_content;
	}

	public void setRcomm_content(String rcomm_content) {
		this.rcomm_content = rcomm_content;
	}

	public Date getRcomm_date() {
		return rcomm_date;
	}

	public void setRcomm_date(Date rcomm_date) {
		this.rcomm_date = rcomm_date;
	}

	public int getRcomm_step() {
		return rcomm_step;
	}

	public void setRcomm_step(int rcomm_step) {
		this.rcomm_step = rcomm_step;
	}

	public int getRcomm_ref() {
		return rcomm_ref;
	}

	public void setRcomm_ref(int rcomm_ref) {
		this.rcomm_ref = rcomm_ref;
	}

	public int getRcomm_lev() {
		return rcomm_lev;
	}

	public void setRcomm_lev(int rcomm_lev) {
		this.rcomm_lev = rcomm_lev;
	}
	
	
}
