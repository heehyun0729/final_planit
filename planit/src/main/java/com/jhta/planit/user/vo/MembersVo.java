package com.jhta.planit.user.vo;

public class MembersVo {
	private String mem_id;
	private String mem_pwd;
	private String mem_nickname;
	private String mem_email;
	private String mem_gender;
	private int mem_birthyear;
	private int mem_stat;
	private String mem_api;

	public MembersVo() {
	}

	public MembersVo(String mem_id, String mem_pwd, String mem_nickname, String mem_email, String mem_gender,
			int mem_birthyear, int mem_stat, String mem_api) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_nickname = mem_nickname;
		this.mem_email = mem_email;
		this.mem_gender = mem_gender;
		this.mem_birthyear = mem_birthyear;
		this.mem_stat = mem_stat;
		this.mem_api = mem_api;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public int getMem_birthyear() {
		return mem_birthyear;
	}

	public void setMem_birthyear(int mem_birthyear) {
		this.mem_birthyear = mem_birthyear;
	}

	public int getMem_stat() {
		return mem_stat;
	}

	public void setMem_stat(int mem_stat) {
		this.mem_stat = mem_stat;
	}

	public String getMem_api() {
		return mem_api;
	}

	public void setMem_api(String mem_api) {
		this.mem_api = mem_api;
	}

}
