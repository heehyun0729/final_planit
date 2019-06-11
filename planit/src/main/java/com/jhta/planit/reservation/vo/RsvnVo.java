package com.jhta.planit.reservation.vo;

public class RsvnVo {
	private int rsvn_num;
	private String mem_id;
	private int room_num;
	private String rsvn_checkin;
	private String rsvn_checkout;
	private int rsvn_cnt;
	private String rsvn_name;
	private String rsvn_email;
	private String rsvn_phone;
	
	public RsvnVo() {}

	public RsvnVo(int rsvn_num, String mem_id, int room_num, String rsvn_checkin, String rsvn_checkout, int rsvn_cnt,
			String rsvn_name, String rsvn_email, String rsvn_phone) {
		super();
		this.rsvn_num = rsvn_num;
		this.mem_id = mem_id;
		this.room_num = room_num;
		this.rsvn_checkin = rsvn_checkin;
		this.rsvn_checkout = rsvn_checkout;
		this.rsvn_cnt = rsvn_cnt;
		this.rsvn_name = rsvn_name;
		this.rsvn_email = rsvn_email;
		this.rsvn_phone = rsvn_phone;
	}

	public int getRsvn_num() {
		return rsvn_num;
	}

	public void setRsvn_num(int rsvn_num) {
		this.rsvn_num = rsvn_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getRsvn_checkin() {
		return rsvn_checkin;
	}

	public void setRsvn_checkin(String rsvn_checkin) {
		this.rsvn_checkin = rsvn_checkin;
	}

	public String getRsvn_checkout() {
		return rsvn_checkout;
	}

	public void setRsvn_checkout(String rsvn_checkout) {
		this.rsvn_checkout = rsvn_checkout;
	}

	public int getRsvn_cnt() {
		return rsvn_cnt;
	}

	public void setRsvn_cnt(int rsvn_cnt) {
		this.rsvn_cnt = rsvn_cnt;
	}

	public String getRsvn_name() {
		return rsvn_name;
	}

	public void setRsvn_name(String rsvn_name) {
		this.rsvn_name = rsvn_name;
	}

	public String getRsvn_email() {
		return rsvn_email;
	}

	public void setRsvn_email(String rsvn_email) {
		this.rsvn_email = rsvn_email;
	}

	public String getRsvn_phone() {
		return rsvn_phone;
	}

	public void setRsvn_phone(String rsvn_phone) {
		this.rsvn_phone = rsvn_phone;
	}
	
}
