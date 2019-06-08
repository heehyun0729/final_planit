package com.jhta.planit.accom.vo;


public class AccomVo {
	private int accom_num;
	private int sell_num;
	private String accom_name;
	private String accom_addr; 
	private String accom_comm; 
	private String accom_country;
	private String accom_city;
	private String accommImg_orgImg;
	private String accommImg_saveImg;
	private int accomChk;
	public AccomVo() {}
	public AccomVo(int accom_num, int sell_num, String accom_name, String accom_addr, String accom_comm,
			String accom_country, String accom_city, String accommImg_orgImg, String accommImg_saveImg, int accomChk) {
		super();
		this.accom_num = accom_num;
		this.sell_num = sell_num;
		this.accom_name = accom_name;
		this.accom_addr = accom_addr;
		this.accom_comm = accom_comm;
		this.accom_country = accom_country;
		this.accom_city = accom_city;
		this.accommImg_orgImg = accommImg_orgImg;
		this.accommImg_saveImg = accommImg_saveImg;
		this.accomChk = accomChk;
	}
	public int getAccom_num() {
		return accom_num;
	}
	public void setAccom_num(int accom_num) {
		this.accom_num = accom_num;
	}
	public int getSell_num() {
		return sell_num;
	}
	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}
	public String getAccom_name() {
		return accom_name;
	}
	public void setAccom_name(String accom_name) {
		this.accom_name = accom_name;
	}
	public String getAccom_addr() {
		return accom_addr;
	}
	public void setAccom_addr(String accom_addr) {
		this.accom_addr = accom_addr;
	}
	public String getAccom_comm() {
		return accom_comm;
	}
	public void setAccom_comm(String accom_comm) {
		this.accom_comm = accom_comm;
	}
	public String getAccom_country() {
		return accom_country;
	}
	public void setAccom_country(String accom_country) {
		this.accom_country = accom_country;
	}
	public String getAccom_city() {
		return accom_city;
	}
	public void setAccom_city(String accom_city) {
		this.accom_city = accom_city;
	}
	public String getAccommImg_orgImg() {
		return accommImg_orgImg;
	}
	public void setAccommImg_orgImg(String accommImg_orgImg) {
		this.accommImg_orgImg = accommImg_orgImg;
	}
	public String getAccommImg_saveImg() {
		return accommImg_saveImg;
	}
	public void setAccommImg_saveImg(String accommImg_saveImg) {
		this.accommImg_saveImg = accommImg_saveImg;
	}
	public int getAccomChk() {
		return accomChk;
	}
	public void setAccomChk(int accomChk) {
		this.accomChk = accomChk;
	}
 
}

