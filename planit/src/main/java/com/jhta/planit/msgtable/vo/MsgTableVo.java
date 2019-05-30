package com.jhta.planit.msgtable.vo;

import java.sql.Date;

public class MsgTableVo {
	private int msgNum;
	private String msgContent;
	private String sendMemId; //송신아이디
	private String receiveMemId; // 수신아이디
	private Date msgWdate;
	private int msgCheck;
	private String msgDelete;
	private String msgDeletee;
	
	public MsgTableVo() {}

	public MsgTableVo(int msgNum, String msgContent, String sendMemId, String receiveMemId, Date msgWdate, int msgCheck,
			String msgDelete, String msgDeletee) {
		super();
		this.msgNum = msgNum;
		this.msgContent = msgContent;
		this.sendMemId = sendMemId;
		this.receiveMemId = receiveMemId;
		this.msgWdate = msgWdate;
		this.msgCheck = msgCheck;
		this.msgDelete = msgDelete;
		this.msgDeletee = msgDeletee;
	}

	public int getMsgNum() {
		return msgNum;
	}

	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getSendMemId() {
		return sendMemId;
	}

	public void setSendMemId(String sendMemId) {
		this.sendMemId = sendMemId;
	}

	public String getReceiveMemId() {
		return receiveMemId;
	}

	public void setReceiveMemId(String receiveMemId) {
		this.receiveMemId = receiveMemId;
	}

	public Date getMsgWdate() {
		return msgWdate;
	}

	public void setMsgWdate(Date msgWdate) {
		this.msgWdate = msgWdate;
	}

	public int getMsgCheck() {
		return msgCheck;
	}

	public void setMsgCheck(int msgCheck) {
		this.msgCheck = msgCheck;
	}

	public String getMsgDelete() {
		return msgDelete;
	}

	public void setMsgDelete(String msgDelete) {
		this.msgDelete = msgDelete;
	}

	public String getMsgDeletee() {
		return msgDeletee;
	}

	public void setMsgDeletee(String msgDeletee) {
		this.msgDeletee = msgDeletee;
	}

	@Override
	public String toString() {
		return "MsgTableVo [msgNum=" + msgNum + ", msgContent=" + msgContent + ", sendMemId=" + sendMemId
				+ ", receiveMemId=" + receiveMemId + ", msgWdate=" + msgWdate + ", msgCheck=" + msgCheck
				+ ", msgDelete=" + msgDelete + ", msgDeletee=" + msgDeletee + "]";
	}
}

