package com.join.vo;

public class MemberDto {
	private int mem_num;
	private String email;
	private String name;
	private String pw;
	private String phone_num;
	private String last_date;
	private int point;
	public MemberDto(int mem_num, String email, String name, String pw, String phone_num, String last_date, int point) {
		this.mem_num = mem_num;
		this.email = email;
		this.name = name;
		this.pw = pw;
		this.phone_num = phone_num;
		this.last_date = last_date;
		this.point = point;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getLast_date() {
		return last_date;
	}
	public void setLast_date(String last_date) {
		this.last_date = last_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

	
}
