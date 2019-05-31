package com.jhta.planit.buddy.vo;

import java.util.List;

public class BuddyListVo {
	private String mem_id;
	private String buddy_indate;
	private String buddy_outdate;
	private String buddy_gender;
	private String buddy_birthyear;
	private String buddy_msg;
	private List<String> buddy_city;
	
	public BuddyListVo() {
		// TODO Auto-generated constructor stub
	}

	public BuddyListVo(String mem_id, String buddy_indate, String buddy_outdate, String buddy_gender,
			String buddy_birthyear, String buddy_msg, List<String> buddy_city) {
		super();
		this.mem_id = mem_id;
		this.buddy_indate = buddy_indate;
		this.buddy_outdate = buddy_outdate;
		this.buddy_gender = buddy_gender;
		this.buddy_birthyear = buddy_birthyear;
		this.buddy_msg = buddy_msg;
		this.buddy_city = buddy_city;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getBuddy_indate() {
		return buddy_indate;
	}

	public void setBuddy_indate(String buddy_indate) {
		this.buddy_indate = buddy_indate;
	}

	public String getBuddy_outdate() {
		return buddy_outdate;
	}

	public void setBuddy_outdate(String buddy_outdate) {
		this.buddy_outdate = buddy_outdate;
	}

	public String getBuddy_gender() {
		return buddy_gender;
	}

	public void setBuddy_gender(String buddy_gender) {
		this.buddy_gender = buddy_gender;
	}

	public String getBuddy_birthyear() {
		return buddy_birthyear;
	}

	public void setBuddy_birthyear(String buddy_birthyear) {
		this.buddy_birthyear = buddy_birthyear;
	}

	public String getBuddy_msg() {
		return buddy_msg;
	}

	public void setBuddy_msg(String buddy_msg) {
		this.buddy_msg = buddy_msg;
	}

	public List<String> getBuddy_city() {
		return buddy_city;
	}

	public void setBuddy_city(List<String> buddy_city) {
		this.buddy_city = buddy_city;
	}
	
	
}
