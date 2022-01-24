package com.join.vo;

public class OrderListDto {
	int pr_num;
	int mem_num;
	int quantity;
	String final_price;
	String pay_date;
	String reserve_date;
	String request_pay;
	
	public OrderListDto() {};
	
	public OrderListDto(int pr_num, int mem_num, int quantity, String final_price, String pay_date, String reserve_date,
			String request_pay) {
		this.pr_num = pr_num;
		this.mem_num = mem_num;
		this.quantity = quantity;
		this.final_price = final_price;
		this.pay_date = pay_date;
		this.reserve_date = reserve_date;
		this.request_pay = request_pay;
	}
	
	public int getPr_num() {
		return pr_num;
	}
	public void setPr_num(int pr_num) {
		this.pr_num = pr_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getFinal_price() {
		return final_price;
	}
	public void setFinal_price(String final_price) {
		this.final_price = final_price;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getRequest_pay() {
		return request_pay;
	}
	public void setRequest_pay(String request_pay) {
		this.request_pay = request_pay;
	}
	
	
	
	
}
