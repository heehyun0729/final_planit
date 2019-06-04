package com.jhta.planit.user.vo;

public class ProfileVo {
	private int profile_no;
	private String mem_id;
	private int profile_open;
	private String profile_comm;

	public ProfileVo() {
	}

	public ProfileVo(int profile_no, String mem_id, int profile_open, String profile_comm) {
		super();
		this.profile_no = profile_no;
		this.mem_id = mem_id;
		this.profile_open = profile_open;
		this.profile_comm = profile_comm;
	}

	public int getProfile_no() {
		return profile_no;
	}

	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getProfile_open() {
		return profile_open;
	}

	public void setProfile_open(int profile_open) {
		this.profile_open = profile_open;
	}

	public String getProfile_comm() {
		return profile_comm;
	}

	public void setProfile_comm(String profile_comm) {
		this.profile_comm = profile_comm;
	}

}
