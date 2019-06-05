package com.jhta.planit.seller.vo;


public class SellerVo {
	private int sell_num;
	private String mem_id;
	private String sell_company; 
	private String sell_addr; 
	
	public SellerVo() {}

	public SellerVo(int sell_num, String mem_id, String sell_company, String sell_addr) {
		super();
		this.sell_num = sell_num;
		this.mem_id = mem_id;
		this.sell_company = sell_company;
		this.sell_addr = sell_addr;
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

	public String getSell_addr() {
		return sell_addr;
	}

	public void setSell_addr(String sell_addr) {
		this.sell_addr = sell_addr;
	}
	
}

