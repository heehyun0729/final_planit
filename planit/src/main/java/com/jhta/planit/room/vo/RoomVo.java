package com.jhta.planit.room.vo;

import java.sql.Date;

public class RoomVo {
	private int room_num;
	private int accom_num;
	private String room_type;
	private String room_price; 
	private String room_comm; 
	
	public RoomVo() {}

	public RoomVo(int room_num, int accom_num, String room_type, String room_price, String room_comm) {
		super();
		this.room_num = room_num;
		this.accom_num = accom_num;
		this.room_type = room_type;
		this.room_price = room_price;
		this.room_comm = room_comm;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public int getAccom_num() {
		return accom_num;
	}

	public void setAccom_num(int accom_num) {
		this.accom_num = accom_num;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRoom_price() {
		return room_price;
	}

	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

	public String getRoom_comm() {
		return room_comm;
	}

	public void setRoom_comm(String room_comm) {
		this.room_comm = room_comm;
	}
}

