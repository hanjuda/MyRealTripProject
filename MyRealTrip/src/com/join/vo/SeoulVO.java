package com.join.vo;

public class SeoulVO {
	private int pr_num;
	private String s_area;
	private String category;
	private String pr_name;
	private String category_area;
	private String company;
	private String type;
	private String time;
	private String meeting;
	private int price;
	private int dc_price;
	private int buytonow;
	private String image;
	private String finish_date;
	private String trip;
	private String seoul_tour;
	   
	public SeoulVO() {}

	public SeoulVO(int pr_num, String s_area, String category, String pr_name, String category_area, String company,
			String type, String time, String meeting, int price, int dc_price, int buytonow, String image,
			String finish_date, String trip, String seoul_tour) {
		this.pr_num = pr_num;
		this.s_area = s_area;
		this.category = category;
		this.pr_name = pr_name;
		this.category_area = category_area;
		this.company = company;
		this.type = type;
		this.time = time;
		this.meeting = meeting;
		this.price = price;
		this.dc_price = dc_price;
		this.buytonow = buytonow;
		this.image = image;
		this.finish_date = finish_date;
		this.trip = trip;
		this.seoul_tour = seoul_tour;
	}

	public int getPr_num() {
		return pr_num;
	}

	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
	}

	public String getS_area() {
		return s_area;
	}

	public void setS_area(String s_area) {
		this.s_area = s_area;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public String getCategory_area() {
		return category_area;
	}

	public void setCategory_area(String category_area) {
		this.category_area = category_area;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMeeting() {
		return meeting;
	}

	public void setMeeting(String meeting) {
		this.meeting = meeting;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDc_price() {
		return dc_price;
	}

	public void setDc_price(int dc_price) {
		this.dc_price = dc_price;
	}

	public int getBuytonow() {
		return buytonow;
	}

	public void setBuytonow(int buytonow) {
		this.buytonow = buytonow;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getFinish_date() {
		return finish_date;
	}

	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}

	public String getTrip() {
		return trip;
	}

	public void setTrip(String trip) {
		this.trip = trip;
	}

	public String getSeoul_tour() {
		return seoul_tour;
	}

	public void setSeoul_tour(String seoul_tour) {
		this.seoul_tour = seoul_tour;
	};
	
	
}
