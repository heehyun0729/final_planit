package com.jhta.planit.plan.vo;

public class PlanVo {
	private int plan_num;
	private String mem_id;
	private String plan_title;
	private String plan_startDate;
	private int plan_stays;
	private String plan_img;
	private int plan_public;

	public PlanVo() {}

	public PlanVo(int plan_num, String mem_id, String plan_title, String plan_startDate, int plan_stays, String plan_img,
			int plan_public) {
		super();
		this.plan_num = plan_num;
		this.mem_id = mem_id;
		this.plan_title = plan_title;
		this.plan_startDate = plan_startDate;
		this.plan_stays = plan_stays;
		this.plan_img = plan_img;
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

	public String getPlan_startDate() {
		return plan_startDate;
	}

	public void setPlan_startDate(String plan_startDate) {
		this.plan_startDate = plan_startDate;
	}

	public int getPlan_stays() {
		return plan_stays;
	}

	public void setPlan_stays(int plan_stays) {
		this.plan_stays = plan_stays;
	}

	public String getPlan_img() {
		return plan_img;
	}

	public void setPlan_img(String plan_img) {
		this.plan_img = plan_img;
	}

	public int getPlan_public() {
		return plan_public;
	}

	public void setPlan_public(int plan_public) {
		this.plan_public = plan_public;
	}

}
