package com.jhta.planit.buddy.vo;

public class BuddyApplyVo {
	private int apply_num;
	private int buddy_num;
	private String mem_id;
	private int apply_state;
	
	public BuddyApplyVo() {
		// TODO Auto-generated constructor stub
	}

	public BuddyApplyVo(int apply_num, int buddy_num, String mem_id, int apply_state) {
		super();
		this.apply_num = apply_num;
		this.buddy_num = buddy_num;
		this.mem_id = mem_id;
		this.apply_state = apply_state;
	}

	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
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

	public int getApply_state() {
		return apply_state;
	}

	public void setApply_state(int apply_state) {
		this.apply_state = apply_state;
	}
}
