package com.jhta.planit.plan.vo;

public class PlanDetailVo {
	private int planDetail_num;
	private int plan_num;
	private int planDetail_order;
	private String planDetail_country;
	private String planDetail_city;
	private String planDetail_lat;
	private String planDetail_lng;
	private String planDetail_inDate;
	private String planDetail_outDate;
	private int planDetail_stay;
	private String planDetail_detail;
	
	public PlanDetailVo() {}

	public PlanDetailVo(int planDetail_num, int plan_num, int planDetail_order, String planDetail_country,
			String planDetail_city, String planDetail_lat, String planDetail_lng, String planDetail_inDate,
			String planDetail_outDate, int planDetail_stay, String planDetail_detail) {
		super();
		this.planDetail_num = planDetail_num;
		this.plan_num = plan_num;
		this.planDetail_order = planDetail_order;
		this.planDetail_country = planDetail_country;
		this.planDetail_city = planDetail_city;
		this.planDetail_lat = planDetail_lat;
		this.planDetail_lng = planDetail_lng;
		this.planDetail_inDate = planDetail_inDate;
		this.planDetail_outDate = planDetail_outDate;
		this.planDetail_stay = planDetail_stay;
		this.planDetail_detail = planDetail_detail;
	}

	public int getPlanDetail_num() {
		return planDetail_num;
	}

	public void setPlanDetail_num(int planDetail_num) {
		this.planDetail_num = planDetail_num;
	}

	public int getPlan_num() {
		return plan_num;
	}

	public void setPlan_num(int plan_num) {
		this.plan_num = plan_num;
	}

	public int getPlanDetail_order() {
		return planDetail_order;
	}

	public void setPlanDetail_order(int planDetail_order) {
		this.planDetail_order = planDetail_order;
	}

	public String getPlanDetail_country() {
		return planDetail_country;
	}

	public void setPlanDetail_country(String planDetail_country) {
		this.planDetail_country = planDetail_country;
	}

	public String getPlanDetail_city() {
		return planDetail_city;
	}

	public void setPlanDetail_city(String planDetail_city) {
		this.planDetail_city = planDetail_city;
	}

	public String getPlanDetail_lat() {
		return planDetail_lat;
	}

	public void setPlanDetail_lat(String planDetail_lat) {
		this.planDetail_lat = planDetail_lat;
	}

	public String getPlanDetail_lng() {
		return planDetail_lng;
	}

	public void setPlanDetail_lng(String planDetail_lng) {
		this.planDetail_lng = planDetail_lng;
	}

	public String getPlanDetail_inDate() {
		return planDetail_inDate;
	}

	public void setPlanDetail_inDate(String planDetail_inDate) {
		this.planDetail_inDate = planDetail_inDate;
	}

	public String getPlanDetail_outDate() {
		return planDetail_outDate;
	}

	public void setPlanDetail_outDate(String planDetail_outDate) {
		this.planDetail_outDate = planDetail_outDate;
	}

	public int getPlanDetail_stay() {
		return planDetail_stay;
	}

	public void setPlanDetail_stay(int planDetail_stay) {
		this.planDetail_stay = planDetail_stay;
	}

	public String getPlanDetail_detail() {
		return planDetail_detail;
	}

	public void setPlanDetail_detail(String planDetail_detail) {
		this.planDetail_detail = planDetail_detail;
	}
	
}
