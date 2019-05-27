package com.jhta.planit.qna.vo;

import java.sql.Date;

public class QnaCommVo {
	private int qcomm_num;
	private String rcomm_content;
	private int qna_num;
	private String mem_id;
	private Date rcomm_date;
	private int rcomm_step;
	private int rcomm_ref;
	private int rcomm_lev;
public QnaCommVo() {}
public QnaCommVo(int qcomm_num, String rcomm_content, int qna_num, String mem_id, Date rcomm_date, int rcomm_step,
		int rcomm_ref, int rcomm_lev) {
	super();
	this.qcomm_num = qcomm_num;
	this.rcomm_content = rcomm_content;
	this.qna_num = qna_num;
	this.mem_id = mem_id;
	this.rcomm_date = rcomm_date;
	this.rcomm_step = rcomm_step;
	this.rcomm_ref = rcomm_ref;
	this.rcomm_lev = rcomm_lev;
}
public int getQcomm_num() {
	return qcomm_num;
}
public void setQcomm_num(int qcomm_num) {
	this.qcomm_num = qcomm_num;
}
public String getRcomm_content() {
	return rcomm_content;
}
public void setRcomm_content(String rcomm_content) {
	this.rcomm_content = rcomm_content;
}
public int getQna_num() {
	return qna_num;
}
public void setQna_num(int qna_num) {
	this.qna_num = qna_num;
}
public String getMem_id() {
	return mem_id;
}
public void setMem_id(String mem_id) {
	this.mem_id = mem_id;
}
public Date getRcomm_date() {
	return rcomm_date;
}
public void setRcomm_date(Date rcomm_date) {
	this.rcomm_date = rcomm_date;
}
public int getRcomm_step() {
	return rcomm_step;
}
public void setRcomm_step(int rcomm_step) {
	this.rcomm_step = rcomm_step;
}
public int getRcomm_ref() {
	return rcomm_ref;
}
public void setRcomm_ref(int rcomm_ref) {
	this.rcomm_ref = rcomm_ref;
}
public int getRcomm_lev() {
	return rcomm_lev;
}
public void setRcomm_lev(int rcomm_lev) {
	this.rcomm_lev = rcomm_lev;
}
}

