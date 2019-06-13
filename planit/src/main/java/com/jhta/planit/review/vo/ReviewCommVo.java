package com.jhta.planit.review.vo;

import java.sql.Date;

public class ReviewCommVo {
	private int rcomm_num;
	private int review_num;
	private String mem_id;
	private String rcomm_content;
	private Date rcomm_date;
	private int rcomm_step;
	private int rcomm_ref;
	private int rcomm_lev;
	private int rcommChk;
	
	public ReviewCommVo() {}

	public ReviewCommVo(int rcomm_num, int review_num, String mem_id, String rcomm_content, Date rcomm_date,
			int rcomm_step, int rcomm_ref, int rcomm_lev, int rcommChk) {
		super();
		this.rcomm_num = rcomm_num;
		this.review_num = review_num;
		this.mem_id = mem_id;
		this.rcomm_content = rcomm_content;
		this.rcomm_date = rcomm_date;
		this.rcomm_step = rcomm_step;
		this.rcomm_ref = rcomm_ref;
		this.rcomm_lev = rcomm_lev;
		this.rcommChk = rcommChk;
	}

	public int getRcomm_num() {
		return rcomm_num;
	}

	public void setRcomm_num(int rcomm_num) {
		this.rcomm_num = rcomm_num;
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

	public int getRcommChk() {
		return rcommChk;
	}

	public void setRcommChk(int rcommChk) {
		this.rcommChk = rcommChk;
	}

	@Override
	public String toString() {
		return "ReviewCommVo [rcomm_num=" + rcomm_num + ", review_num=" + review_num + ", mem_id=" + mem_id
				+ ", rcomm_content=" + rcomm_content + ", rcomm_date=" + rcomm_date + ", rcomm_step=" + rcomm_step
				+ ", rcomm_ref=" + rcomm_ref + ", rcomm_lev=" + rcomm_lev + ", rcommChk=" + rcommChk + "]";
	}

	
	
}
