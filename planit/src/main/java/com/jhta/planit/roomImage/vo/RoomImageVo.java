package com.jhta.planit.roomImage.vo;



public class RoomImageVo {
	private int roomImg_num;
	private int room_num;
	private String roomImg_orgImg;
	private String roomImg_saveImg; 
	
	public RoomImageVo() {}

	public RoomImageVo(int roomImg_num, int room_num, String roomImg_orgImg, String roomImg_saveImg) {
		super();
		this.roomImg_num = roomImg_num;
		this.room_num = room_num;
		this.roomImg_orgImg = roomImg_orgImg;
		this.roomImg_saveImg = roomImg_saveImg;
	}

	public int getRoomImg_num() {
		return roomImg_num;
	}

	public void setRoomImg_num(int roomImg_num) {
		this.roomImg_num = roomImg_num;
	}

	public int getRoom_num() {
		return room_num;
	}

	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}

	public String getRoomImg_orgImg() {
		return roomImg_orgImg;
	}

	public void setRoomImg_orgImg(String roomImg_orgImg) {
		this.roomImg_orgImg = roomImg_orgImg;
	}

	public String getRoomImg_saveImg() {
		return roomImg_saveImg;
	}

	public void setRoomImg_saveImg(String roomImg_saveImg) {
		this.roomImg_saveImg = roomImg_saveImg;
	}
}

