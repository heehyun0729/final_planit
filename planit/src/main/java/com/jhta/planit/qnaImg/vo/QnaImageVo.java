package com.jhta.planit.qnaImg.vo;

public class QnaImageVo {
	private int qnaImg_num;
	private int qna_num;
	private String qnaImg_orgImg;
	private String qnaImg_saveImg;
	
	
public QnaImageVo(){} 

public QnaImageVo(int qnaImg_num, int qna_num, String qnaImg_orgImg, String qnaImg_saveImg) {
	super();
	this.qnaImg_num = qnaImg_num;
	this.qna_num = qna_num;
	this.qnaImg_orgImg = qnaImg_orgImg;
	this.qnaImg_saveImg = qnaImg_saveImg;
}

public int getQnaImg_num() {
	return qnaImg_num;
}

public void setQnaImg_num(int qnaImg_num) {
	this.qnaImg_num = qnaImg_num;
}

public int getQna_num() {
	return qna_num;
}

public void setQna_num(int qna_num) {
	this.qna_num = qna_num;
}

public String getQnaImg_orgImg() {
	return qnaImg_orgImg;
}

public void setQnaImg_orgImg(String qnaImg_orgImg) {
	this.qnaImg_orgImg = qnaImg_orgImg;
}

public String getQnaImg_saveImg() {
	return qnaImg_saveImg;
}

public void setQnaImg_saveImg(String qnaImg_saveImg) {
	this.qnaImg_saveImg = qnaImg_saveImg;
}

}