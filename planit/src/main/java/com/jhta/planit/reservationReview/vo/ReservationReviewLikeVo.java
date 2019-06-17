package com.jhta.planit.reservationReview.vo;

public class ReservationReviewLikeVo {
	private int resreview_likenum;
	private String mem_id;
	private int resreview_num;
	private int resreview_like;
	
	public ReservationReviewLikeVo() {}

	public ReservationReviewLikeVo(int resreview_likenum, String mem_id, int resreview_num, int resreview_like) {
		super();
		this.resreview_likenum = resreview_likenum;
		this.mem_id = mem_id;
		this.resreview_num = resreview_num;
		this.resreview_like = resreview_like;
	}

	public int getResreview_likenum() {
		return resreview_likenum;
	}

	public void setResreview_likenum(int resreview_likenum) {
		this.resreview_likenum = resreview_likenum;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getResreview_num() {
		return resreview_num;
	}

	public void setResreview_num(int resreview_num) {
		this.resreview_num = resreview_num;
	}

	public int getResreview_like() {
		return resreview_like;
	}

	public void setResreview_like(int resreview_like) {
		this.resreview_like = resreview_like;
	}

	@Override
	public String toString() {
		return "ReservationReviewLikeVo [resreview_likenum=" + resreview_likenum + ", mem_id=" + mem_id
				+ ", resreview_num=" + resreview_num + ", resreview_like=" + resreview_like + "]";
	}
	
	
}
