package com.jhta.planit.reservation.vo;

public class MyRsvnVo {
	private int rsvn_num;
	private String rsvn_checkin;
	private String rsvn_checkout;
	private int rsvn_cnt;
	private String rsvnPay_id;
	private int rsvnPay_stat;
	private String rsvnPay_date;
	private int accom_num;
	private String accom_name;
	private int room_num;
	private String room_type;
	private int room_capa;
	
	public MyRsvnVo() {}

	public MyRsvnVo(int rsvn_num, String rsvn_checkin, String rsvn_checkout, int rsvn_cnt, String rsvnPay_id,
			int rsvnPay_stat, String rsvnPay_date, int accom_num, String accom_name, int room_num, String room_type, int room_capa) {
		super();
		this.rsvn_num = rsvn_num;
		this.rsvn_checkin = rsvn_checkin;
		this.rsvn_checkout = rsvn_checkout;
		this.rsvn_cnt = rsvn_cnt;
		this.rsvnPay_id = rsvnPay_id;
		this.rsvnPay_stat = rsvnPay_stat;
		this.rsvnPay_date = rsvnPay_date;
		this.accom_num = accom_num;
		this.accom_name = accom_name;
		this.room_num = room_num;
		this.room_type = room_type;
		this.room_capa = room_capa;
	}

	public int getRsvn_num() {
		return rsvn_num;
	}

	public void setRsvn_num(int rsvn_num) {
		this.rsvn_num = rsvn_num;
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

	public String getRsvnPay_id() {
		return rsvnPay_id;
	}

	public void setRsvnPay_id(String rsvnPay_id) {
		this.rsvnPay_id = rsvnPay_id;
	}

	public int getRsvnPay_stat() {
		return rsvnPay_stat;
	}

	public void setRsvnPay_stat(int rsvnPay_stat) {
		this.rsvnPay_stat = rsvnPay_stat;
	}

	public String getRsvnPay_date() {
		return rsvnPay_date;
	}

	public void setRsvnPay_date(String rsvnPay_date) {
		this.rsvnPay_date = rsvnPay_date;
	}

	public int getAccom_num() {
		return accom_num;
	}

	public void setAccom_num(int accom_num) {
		this.accom_num = accom_num;
	}

	public String getAccom_name() {
		return accom_name;
	}

	public void setAccom_name(String accom_name) {
		this.accom_name = accom_name;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public int getRoom_capa() {
		return room_capa;
	}

	public void setRoom_capa(int room_capa) {
		this.room_capa = room_capa;
	}
	
}
