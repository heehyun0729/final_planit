package com.jhta.planit.admin.vo;

import java.sql.Date;

public class AdVo {
	private int ad_num;
	private String mem_id;
	private String ad_company;
	private String ad_url;
	private Date ad_requestDate;
	private Date ad_approveDate;
	private int ad_price;
	private String ad_payment;
	private String ad_tid;
	private int progress;
	public AdVo() {}
	public AdVo(int ad_num, String mem_id, String ad_company, String ad_url, Date ad_requestDate, Date ad_approveDate,
			int ad_price, String ad_payment, String ad_tid, int progress) {
		super();
		this.ad_num = ad_num;
		this.mem_id = mem_id;
		this.ad_company = ad_company;
		this.ad_url = ad_url;
		this.ad_requestDate = ad_requestDate;
		this.ad_approveDate = ad_approveDate;
		this.ad_price = ad_price;
		this.ad_payment = ad_payment;
		this.ad_tid = ad_tid;
		this.progress = progress;
	}
	public int getAd_num() {
		return ad_num;
	}
	public void setAd_num(int ad_num) {
		this.ad_num = ad_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAd_company() {
		return ad_company;
	}
	public void setAd_company(String ad_company) {
		this.ad_company = ad_company;
	}
	public String getAd_url() {
		return ad_url;
	}
	public void setAd_url(String ad_url) {
		this.ad_url = ad_url;
	}
	public Date getAd_requestDate() {
		return ad_requestDate;
	}
	public void setAd_requestDate(Date ad_requestDate) {
		this.ad_requestDate = ad_requestDate;
	}
	public Date getAd_approveDate() {
		return ad_approveDate;
	}
	public void setAd_approveDate(Date ad_approveDate) {
		this.ad_approveDate = ad_approveDate;
	}
	public int getAd_price() {
		return ad_price;
	}
	public void setAd_price(int ad_price) {
		this.ad_price = ad_price;
	}
	public String getAd_payment() {
		return ad_payment;
	}
	public void setAd_payment(String ad_payment) {
		this.ad_payment = ad_payment;
	}
	public String getAd_tid() {
		return ad_tid;
	}
	public void setAd_tid(String ad_tid) {
		this.ad_tid = ad_tid;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	@Override
	public String toString() {
		return "AdVo [ad_num=" + ad_num + ", mem_id=" + mem_id + ", ad_company=" + ad_company + ", ad_url=" + ad_url
				+ ", ad_requestDate=" + ad_requestDate + ", ad_approveDate=" + ad_approveDate + ", ad_price=" + ad_price
				+ ", ad_payment=" + ad_payment + ", ad_tid=" + ad_tid + ", progress=" + progress + "]";
	}
	
}
