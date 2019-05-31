package com.jhta.planit.qna.vo;

import java.sql.Date;

public class QnaVo {
	private int qna_num;
	private String mem_id;
	private String qna_cate;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	public QnaVo() {}
	public QnaVo(int qna_num, String mem_id, String qna_cate, String qna_title, String qna_content, Date qna_date) {
		this.qna_num = qna_num;
		this.mem_id = mem_id;
		this.qna_cate = qna_cate;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
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
	public String getQna_cate() {
		return qna_cate;
	}
	public void setQna_cate(String qna_cate) {
		this.qna_cate = qna_cate;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	@Override
	public String toString() {
		return "QnaVo [qna_num=" + qna_num + ",mem_id=" + mem_id +",qna_cate=" + qna_cate +", qna_title=" + qna_title
				+ ",qna_content=" + qna_content + ",qna_date=" + qna_date + "]";
	}
	
}
