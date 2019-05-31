package com.jhta.planit.plan.vo;

public class PlanVo {
	private int plan_num;
	private String mem_id;
	private String plan_title;
	private int plan_public;
	
	public PlanVo() {}

	public PlanVo(int plan_num, String mem_id, String plan_title, int plan_public) {
		super();
		this.plan_num = plan_num;
		this.mem_id = mem_id;
		this.plan_title = plan_title;
		this.plan_public = plan_public;
	}

	public int getPlan_num() {
		return plan_num;
	}

	public void setPlan_num(int plan_num) {
		this.plan_num = plan_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}

	public int getPlan_public() {
		return plan_public;
	}

	public void setPlan_public(int plan_public) {
		this.plan_public = plan_public;
	}
	
}
