package com.jhta.planit.qna.vo;

import java.sql.Date;

public class QnaCommVo {
	private int cnum;
	private int qna_num;
	private String mem_id;
	private String comments;

	public QnaCommVo() {}
	
	public QnaCommVo(int cnum, int qna_num, String mem_id, String comments) {
		super();
		this.cnum = cnum;
		this.qna_num = qna_num;
		this.mem_id = mem_id;
		this.comments = comments;
	}
	
	public int getCnum() {
		return cnum;
	}
	
	public void setCnum(int cnum) {
		this.cnum = cnum;
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
	
	public String getComments() {
		return comments;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
}

