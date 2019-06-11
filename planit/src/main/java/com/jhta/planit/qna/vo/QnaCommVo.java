package com.jhta.planit.qna.vo;

import java.sql.Date;

public class QnaCommVo{
	private int qcomm_num;
	private String mem_id;
	private String qcomm_content;
	private Date qcomm_date;
	private int qna_num;
	public QnaCommVo() {}
	public QnaCommVo(int qcomm_num, String mem_id, String qcomm_content, Date qcomm_date, int qna_num) {
		super();
		this.qcomm_num = qcomm_num;
		this.mem_id = mem_id;
		this.qcomm_content = qcomm_content;
		this.qcomm_date = qcomm_date;
		this.qna_num = qna_num;
	}
	public int getQcomm_num() {
		return qcomm_num;
	}
	public void setQcomm_num(int qcomm_num) {
		this.qcomm_num = qcomm_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getQcomm_content() {
		return qcomm_content;
	}
	public void setQcomm_content(String qcomm_content) {
		this.qcomm_content = qcomm_content;
	}
	public Date getQcomm_date() {
		return qcomm_date;
	}
	public void setQcomm_date(Date qcomm_date) {
		this.qcomm_date = qcomm_date;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
}

