package com.jhta.planit.buddy.vo;

public class BuddyCountryVo {
	private int country_num;
	private String buddy_num;
	private String buddy_country;
	
	public BuddyCountryVo() {
		// TODO Auto-generated constructor stub
	}

	public BuddyCountryVo(int country_num, String buddy_num, String buddy_country) {
		super();
		this.country_num = country_num;
		this.buddy_num = buddy_num;
		this.buddy_country = buddy_country;
	}

	public int getCountry_num() {
		return country_num;
	}

	public void setCountry_num(int country_num) {
		this.country_num = country_num;
	}

	public String getBuddy_num() {
		return buddy_num;
	}

	public void setBuddy_num(String buddy_num) {
		this.buddy_num = buddy_num;
	}

	public String getBuddy_country() {
		return buddy_country;
	}

	public void setBuddy_country(String buddy_country) {
		this.buddy_country = buddy_country;
	}
}
