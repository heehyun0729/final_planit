package com.jhta.planit.user.vo;

public class MemImageVo {
	private int img_num;
	private String mem_id;
	private String img_orgimg;
	private String img_saveimg;

	public MemImageVo() {
	}

	public MemImageVo(int img_num, String mem_id, String img_orgimg, String img_saveimg) {
		super();
		this.img_num = img_num;
		this.mem_id = mem_id;
		this.img_orgimg = img_orgimg;
		this.img_saveimg = img_saveimg;
	}

	public int getImg_num() {
		return img_num;
	}

	public void setImg_num(int img_num) {
		this.img_num = img_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getImg_orgimg() {
		return img_orgimg;
	}

	public void setImg_orgimg(String img_orgimg) {
		this.img_orgimg = img_orgimg;
	}

	public String getImg_saveimg() {
		return img_saveimg;
	}

	public void setImg_saveimg(String img_saveimg) {
		this.img_saveimg = img_saveimg;
	}

}
