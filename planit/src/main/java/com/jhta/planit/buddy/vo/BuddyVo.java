package com.jhta.planit.buddy.vo;

import java.sql.Date;

public class BuddyVo {
	private int buddy_num;
	private String mem_id;
	private String buddy_country;
	private String buddy_city;
	private String buddy_gender;
	private int buddy_birthYear;
	private Date buddy_indate;
	private Date buddy_outdate;
	private String buddy_msg;
	private int buddy_state;
	public BuddyVo() {
		// TODO Auto-generated constructor stub
	}
	public BuddyVo(int buddy_num, String mem_id, String buddy_country, String buddy_city, String buddy_gender,
			int buddy_birthYear, Date buddy_indate, Date buddy_outdate, String buddy_msg, int buddy_state) {
		super();
		this.buddy_num = buddy_num;
		this.mem_id = mem_id;
		this.buddy_country = buddy_country;
		this.buddy_city = buddy_city;
		this.buddy_gender = buddy_gender;
		this.buddy_birthYear = buddy_birthYear;
		this.buddy_indate = buddy_indate;
		this.buddy_outdate = buddy_outdate;
		this.buddy_msg = buddy_msg;
		this.buddy_state = buddy_state;
	}
	public int getBuddy_num() {
		return buddy_num;
	}
	public void setBuddy_num(int buddy_num) {
		this.buddy_num = buddy_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBuddy_country() {
		return buddy_country;
	}
	public void setBuddy_country(String buddy_country) {
		this.buddy_country = buddy_country;
	}
	public String getBuddy_city() {
		return buddy_city;
	}
	public void setBuddy_city(String buddy_city) {
		this.buddy_city = buddy_city;
	}
	public String getBuddy_gender() {
		return buddy_gender;
	}
	public void setBuddy_gender(String buddy_gender) {
		this.buddy_gender = buddy_gender;
	}
	public int getBuddy_birthYear() {
		return buddy_birthYear;
	}
	public void setBuddy_birthYear(int buddy_birthYear) {
		this.buddy_birthYear = buddy_birthYear;
	}
	public Date getBuddy_indate() {
		return buddy_indate;
	}
	public void setBuddy_indate(Date buddy_indate) {
		this.buddy_indate = buddy_indate;
	}
	public Date getBuddy_outdate() {
		return buddy_outdate;
	}
	public void setBuddy_outdate(Date buddy_outdate) {
		this.buddy_outdate = buddy_outdate;
	}
	public String getBuddy_msg() {
		return buddy_msg;
	}
	public void setBuddy_msg(String buddy_msg) {
		this.buddy_msg = buddy_msg;
	}
	public int getBuddy_state() {
		return buddy_state;
	}
	public void setBuddy_state(int buddy_state) {
		this.buddy_state = buddy_state;
	}
	
}
