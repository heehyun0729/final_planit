package com.jhta.planit.buddy.vo;

public class BuddyCityVo {
	private int city_num;
	private String country_num;
	private String buddy_city;
	
	public BuddyCityVo() {
		// TODO Auto-generated constructor stub
	}

	public BuddyCityVo(int city_num, String country_num, String buddy_city) {
		super();
		this.city_num = city_num;
		this.country_num = country_num;
		this.buddy_city = buddy_city;
	}

	public int getCity_num() {
		return city_num;
	}

	public void setCity_num(int city_num) {
		this.city_num = city_num;
	}

	public String getCountry_num() {
		return country_num;
	}

	public void setCountry_num(String country_num) {
		this.country_num = country_num;
	}

	public String getBuddy_city() {
		return buddy_city;
	}

	public void setBuddy_city(String buddy_city) {
		this.buddy_city = buddy_city;
	}
	
	
}
