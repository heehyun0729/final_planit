package com.jhta.planit.accomQna.vo;

import java.sql.Date;

public class AccomQnaVo {
	private int accomqna_num;
	private String mem_id;
	private int accom_num;
	private String accomqna_title;
	private String accomqna_content;
	private Date accomqna_date;
	public AccomQnaVo() {}
	public AccomQnaVo(int accomqna_num, String mem_id, int accom_num, String accomqna_title, String accomqna_content,
			Date accomqna_date) {
		super();
		this.accomqna_num = accomqna_num;
		this.mem_id = mem_id;
		this.accom_num = accom_num;
		this.accomqna_title = accomqna_title;
		this.accomqna_content = accomqna_content;
		this.accomqna_date = accomqna_date;
	}
	public int getAccomqna_num() {
		return accomqna_num;
	}
	public void setAccomqna_num(int accomqna_num) {
		this.accomqna_num = accomqna_num;
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
	public String getAccomqna_title() {
		return accomqna_title;
	}
	public void setAccomqna_title(String accomqna_title) {
		this.accomqna_title = accomqna_title;
	}
	public String getAccomqna_content() {
		return accomqna_content;
	}
	public void setAccomqna_content(String accomqna_content) {
		this.accomqna_content = accomqna_content;
	}
	public Date getAccomqna_date() {
		return accomqna_date;
	}
	public void setAccomqna_date(Date accomqna_date) {
		this.accomqna_date = accomqna_date;
	}
}
