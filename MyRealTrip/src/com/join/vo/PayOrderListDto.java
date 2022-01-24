package com.join.vo;

public class PayOrderListDto {
	String pr_name;
	String final_price;
	String	reserve_date;
	String pay_date;
	String request_pay;
	String pr_img;
	int pr_num;
	
	PayOrderListDto(){}

	public PayOrderListDto(String pr_name, String final_price, String reserve_date, String pay_date,
			String request_pay,String pr_img , int pr_num) {
		this.pr_name = pr_name;
		this.final_price = final_price;
		this.reserve_date = reserve_date;
		this.pay_date = pay_date;
		this.request_pay = request_pay;
		this.pr_img =pr_img;
		this.pr_num = pr_num;
	}

	public String getPr_name() {
		return pr_name;
	}

	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

	public String getFinal_price() {
		return final_price;
	}

	public void setFinal_price(String final_price) {
		this.final_price = final_price;
	}

	public String getReserve_date() {
		return reserve_date;
	}

	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getRequest_pay() {
		return request_pay;
	}

	public void setRequest_pay(String request_pay) {
		this.request_pay = request_pay;
	};
	
	public String getPr_img() {
		return pr_img;
	}
	
	public void setPr_img(String pr_img){
		this.pr_img = pr_img;
	}
	public int getPr_num() {
		return pr_num;
	}
	public void setPr_num(int pr_num){
		this.pr_num=pr_num;
	}
	
}
