package com.join.vo;

public class TraVO {
	private String tr;
	private String tr_image;
	private int tr_num;
	
	public TraVO() {}

	public TraVO(String tr, String tr_image, int tr_num) {
		this.tr = tr;
		this.tr_image = tr_image;
		this.tr_num = tr_num;
	}

	public String getTr() {
		return tr;
	}

	public void setTr(String tr) {
		this.tr = tr;
	}

	public String getTr_image() {
		return tr_image;
	}

	public void setTr_image(String tr_image) {
		this.tr_image = tr_image;
	}

	public int getTr_num() {
		return tr_num;
	}

	public void setTr_num(int tr_num) {
		this.tr_num = tr_num;
	}

	
	
	
}
