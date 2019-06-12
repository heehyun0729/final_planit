package com.jhta.planit.reservation.vo;

import java.sql.Date;

public class RsvnPayVo {
	private String rsvnPay_id;
	private int rsvn_num;
	private int rsvnPay_total;
	private int rsvnPay_stat;
	private Date rsvnPay_date;
	
	public RsvnPayVo() {}

	public RsvnPayVo(String rsvnPay_id, int rsvn_num, int rsvnPay_total, int rsvnPay_stat, Date rsvnPay_date) {
		super();
		this.rsvnPay_id = rsvnPay_id;
		this.rsvn_num = rsvn_num;
		this.rsvnPay_total = rsvnPay_total;
		this.rsvnPay_stat = rsvnPay_stat;
		this.rsvnPay_date = rsvnPay_date;
	}

	public String getRsvnPay_id() {
		return rsvnPay_id;
	}

	public void setRsvnPay_id(String rsvnPay_id) {
		this.rsvnPay_id = rsvnPay_id;
	}

	public int getRsvn_num() {
		return rsvn_num;
	}

	public void setRsvn_num(int rsvn_num) {
		this.rsvn_num = rsvn_num;
	}

	public int getRsvnPay_total() {
		return rsvnPay_total;
	}

	public void setRsvnPay_total(int rsvnPay_total) {
		this.rsvnPay_total = rsvnPay_total;
	}

	public int getRsvnPay_stat() {
		return rsvnPay_stat;
	}

	public void setRsvnPay_stat(int rsvnPay_stat) {
		this.rsvnPay_stat = rsvnPay_stat;
	}

	public Date getRsvnPay_date() {
		return rsvnPay_date;
	}

	public void setRsvnPay_date(Date rsvnPay_date) {
		this.rsvnPay_date = rsvnPay_date;
	}
	
}
