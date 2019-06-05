package com.jhta.planit.user.vo;

public class SellerVo {
	private int sell_num;
	private String mem_id;
	private String sell_company;
	private int sell_postcode;
	private String sell_addr;
	private String sell_tel;

	public SellerVo() {
	}

	public SellerVo(int sell_num, String mem_id, String sell_company, int sell_postcode, String sell_addr,
			String sell_tel) {
		super();
		this.sell_num = sell_num;
		this.mem_id = mem_id;
		this.sell_company = sell_company;
		this.sell_postcode = sell_postcode;
		this.sell_addr = sell_addr;
		this.sell_tel = sell_tel;
	}

	public int getSell_num() {
		return sell_num;
	}

	public void setSell_num(int sell_num) {
		this.sell_num = sell_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getSell_company() {
		return sell_company;
	}

	public void setSell_company(String sell_company) {
		this.sell_company = sell_company;
	}

	public int getSell_postcode() {
		return sell_postcode;
	}

	public void setSell_postcode(int sell_postcode) {
		this.sell_postcode = sell_postcode;
	}

	public String getSell_addr() {
		return sell_addr;
	}

	public void setSell_addr(String sell_addr) {
		this.sell_addr = sell_addr;
	}

	public String getSell_tel() {
		return sell_tel;
	}

	public void setSell_tel(String sell_tel) {
		this.sell_tel = sell_tel;
	}

}
