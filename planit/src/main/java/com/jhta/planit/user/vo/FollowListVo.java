package com.jhta.planit.user.vo;

public class FollowListVo {
	private int followno;
	private String mem_id;
	private int profile_no;
	private int follow_grade;

	public FollowListVo() {
	}

	public FollowListVo(int followno, String mem_id, int profile_no, int follow_grade) {
		super();
		this.followno = followno;
		this.mem_id = mem_id;
		this.profile_no = profile_no;
		this.follow_grade = follow_grade;
	}

	public int getFollowno() {
		return followno;
	}

	public void setFollowno(int followno) {
		this.followno = followno;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getProfile_no() {
		return profile_no;
	}

	public void setProfile_no(int profile_no) {
		this.profile_no = profile_no;
	}

	public int getFollow_grade() {
		return follow_grade;
	}

	public void setFollow_grade(int follow_grade) {
		this.follow_grade = follow_grade;
	}

}
