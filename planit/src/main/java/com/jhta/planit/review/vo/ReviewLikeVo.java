package com.jhta.planit.review.vo;

public class ReviewLikeVo {
	private int review_likenum;
	private String mem_id;
	private int review_num;
	private int review_like;
	
	public ReviewLikeVo() {}

	public ReviewLikeVo(int review_likenum, String mem_id, int review_num, int review_like) {
		super();
		this.review_likenum = review_likenum;
		this.mem_id = mem_id;
		this.review_num = review_num;
		this.review_like = review_like;
	}

	public int getReview_likenum() {
		return review_likenum;
	}

	public void setReview_likenum(int review_likenum) {
		this.review_likenum = review_likenum;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	@Override
	public String toString() {
		return "ReviewLikeVo [review_likenum=" + review_likenum + ", mem_id=" + mem_id + ", review_num=" + review_num
				+ ", review_like=" + review_like + "]";
	}

	
}
