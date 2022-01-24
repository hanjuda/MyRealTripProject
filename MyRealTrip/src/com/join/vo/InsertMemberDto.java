package com.join.vo;

public class InsertMemberDto {
	private String name;
	private String email;
	private String pw;
	private int ch1;
	private int ch2;
	private int ch3;
	private int ch4;
	private String phone_num;
	public InsertMemberDto(String name, String email, String pw, int ch1, int ch2, int ch3, int ch4, String phone_num) {
		this.name = name;
		this.email = email;
		this.pw = pw;
		this.ch1 = ch1;
		this.ch2 = ch2;
		this.ch3 = ch3;
		this.ch4 = ch4;
		this.phone_num = phone_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getCh1() {
		return ch1;
	}
	public void setCh1(int ch1) {
		this.ch1 = ch1;
	}
	public int getCh2() {
		return ch2;
	}
	public void setCh2(int ch2) {
		this.ch2 = ch2;
	}
	public int getCh3() {
		return ch3;
	}
	public void setCh3(int ch3) {
		this.ch3 = ch3;
	}
	public int getCh4() {
		return ch4;
	}
	public void setCh4(int ch4) {
		this.ch4 = ch4;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	
	
	
	
}
