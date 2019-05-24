package com.jhta.planit.admin.vo;

import java.sql.Date;

public class AdVo {
	private int ad_num;
	private String mem_id;
	private String ad_url;
	private Date ad_startDate;
	private Date ad_endDate;
	private int ad_chance;
	private int ad_hit;
	private int ad_click;
	private int ad_status;
	private int ad_price;
	private Date ad_requestDate;
	private Date ad_approveDate;
	public AdVo() {}
	public AdVo(int ad_num, String mem_id, String ad_url, Date ad_startDate, Date ad_endDate, int ad_chance, int ad_hit,
			int ad_click, int ad_status, int ad_price, Date ad_requestDate, Date ad_approveDate) {
		super();
		this.ad_num = ad_num;
		this.mem_id = mem_id;
		this.ad_url = ad_url;
		this.ad_startDate = ad_startDate;
		this.ad_endDate = ad_endDate;
		this.ad_chance = ad_chance;
		this.ad_hit = ad_hit;
		this.ad_click = ad_click;
		this.ad_status = ad_status;
		this.ad_price = ad_price;
		this.ad_requestDate = ad_requestDate;
		this.ad_approveDate = ad_approveDate;
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
	public String getAd_url() {
		return ad_url;
	}
	public void setAd_url(String ad_url) {
		this.ad_url = ad_url;
	}
	public Date getAd_startDate() {
		return ad_startDate;
	}
	public void setAd_startDate(Date ad_startDate) {
		this.ad_startDate = ad_startDate;
	}
	public Date getAd_endDate() {
		return ad_endDate;
	}
	public void setAd_endDate(Date ad_endDate) {
		this.ad_endDate = ad_endDate;
	}
	public int getAd_chance() {
		return ad_chance;
	}
	public void setAd_chance(int ad_chance) {
		this.ad_chance = ad_chance;
	}
	public int getAd_hit() {
		return ad_hit;
	}
	public void setAd_hit(int ad_hit) {
		this.ad_hit = ad_hit;
	}
	public int getAd_click() {
		return ad_click;
	}
	public void setAd_click(int ad_click) {
		this.ad_click = ad_click;
	}
	public int getAd_status() {
		return ad_status;
	}
	public void setAd_status(int ad_status) {
		this.ad_status = ad_status;
	}
	public int getAd_price() {
		return ad_price;
	}
	public void setAd_price(int ad_price) {
		this.ad_price = ad_price;
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
}
