package com.jhta.planit.accomQna.vo;

import java.sql.Date;

public class AccomQnaVo {
	private int accomQna_num;
	private String mem_id;
	private int accom_num;
	private String accomQna_title;
	private String accomQna_content;
	private Date accomQna_date;
	public AccomQnaVo() {}
	
	public AccomQnaVo(int accomQna_num, String mem_id, int accom_num, String accomQna_title, String accomQna_content,
			Date accomQna_date) {
		super();
		this.accomQna_num = accomQna_num;
		this.mem_id = mem_id;
		this.accom_num = accom_num;
		this.accomQna_title = accomQna_title;
		this.accomQna_content = accomQna_content;
		this.accomQna_date = accomQna_date;
	}
	public int getAccomQna_num() {
		return accomQna_num;
	}
	public void setAccomQna_num(int accomQna_num) {
		this.accomQna_num = accomQna_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getAccom_num() {
		return accom_num;
	}
	public void setAccom_num(int accom_num) {
		this.accom_num = accom_num;
	}
	public String getAccomQna_title() {
		return accomQna_title;
	}
	public void setAccomQna_title(String accomQna_title) {
		this.accomQna_title = accomQna_title;
	}
	public String getAccomQna_content() {
		return accomQna_content;
	}
	public void setAccomQna_content(String accomQna_content) {
		this.accomQna_content = accomQna_content;
	}
	public Date getAccomQna_date() {
		return accomQna_date;
	}
	public void setAccomQna_date(Date accomQna_date) {
		this.accomQna_date = accomQna_date;
	}
}
