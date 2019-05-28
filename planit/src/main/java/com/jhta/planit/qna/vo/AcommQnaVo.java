package com.jhta.planit.qna.vo;

import java.sql.Date;

public class AcommQnaVo {
	private int acommQna_num;
	private int acomm_num;
	private String mem_id;
	private String acommQna_content;
	private Date acommQna_date;
	private int acommQna_step;
	private int acommQna_ref;
	public AcommQnaVo() {}
	public AcommQnaVo(int acommQna_num, int acomm_num, String mem_id, String acommQna_content, Date acommQna_date,
			int acommQna_step, int acommQna_ref) {
		this.acommQna_num = acommQna_num;
		this.acomm_num = acomm_num;
		this.mem_id = mem_id;
		this.acommQna_content = acommQna_content;
		this.acommQna_date = acommQna_date;
		this.acommQna_step = acommQna_step;
		this.acommQna_ref = acommQna_ref;
	}
	public int getAcommQna_num() {
		return acommQna_num;
	}
	public void setAcommQna_num(int acommQna_num) {
		this.acommQna_num = acommQna_num;
	}
	public int getAcomm_num() {
		return acomm_num;
	}
	public void setAcomm_num(int acomm_num) {
		this.acomm_num = acomm_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getAcommQna_content() {
		return acommQna_content;
	}
	public void setAcommQna_content(String acommQna_content) {
		this.acommQna_content = acommQna_content;
	}
	public Date getAcommQna_date() {
		return acommQna_date;
	}
	public void setAcommQna_date(Date acommQna_date) {
		this.acommQna_date = acommQna_date;
	}
	public int getAcommQna_step() {
		return acommQna_step;
	}
	public void setAcommQna_step(int acommQna_step) {
		this.acommQna_step = acommQna_step;
	}
	public int getAcommQna_ref() {
		return acommQna_ref;
	}
	public void setAcommQna_ref(int acommQna_ref) {
		this.acommQna_ref = acommQna_ref;
	}
	
}
