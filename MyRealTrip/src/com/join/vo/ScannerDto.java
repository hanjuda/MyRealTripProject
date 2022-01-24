package com.join.vo;

public class ScannerDto {
	private int country_num;
	private String country_name;
	private String vaccine;
	private String trip_possible;
	private int injection;
	private int new_patient;
	private String big_flags;
	private String flags;
	
	public ScannerDto() {};
	
	public ScannerDto(int country_num, String country_name, String vaccine, String trip_possible, int injection,
			int new_patient, String big_flags, String flags) {
		this.country_num = country_num;
		this.country_name = country_name;
		this.vaccine = vaccine;
		this.trip_possible = trip_possible;
		this.injection = injection;
		this.new_patient = new_patient;
		this.big_flags = big_flags;
		this.flags = flags;
	}
	public int getCountry_num() {
		return country_num;
	}
	public void setCountry_num(int country_num) {
		this.country_num = country_num;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getVaccine() {
		return vaccine;
	}
	public void setVaccine(String vaccine) {
		this.vaccine = vaccine;
	}
	public String getTrip_possible() {
		return trip_possible;
	}
	public void setTrip_possible(String trip_possible) {
		this.trip_possible = trip_possible;
	}
	public int getInjection() {
		return injection;
	}
	public void setInjection(int injection) {
		this.injection = injection;
	}
	public int getNew_patient() {
		return new_patient;
	}
	public void setNew_patient(int new_patient) {
		this.new_patient = new_patient;
	}
	public String getBig_flags() {
		return big_flags;
	}
	public void setBig_flags(String big_flags) {
		this.big_flags = big_flags;
	}
	public String getFlags() {
		return flags;
	}
	public void setFlags(String flags) {
		this.flags = flags;
	}
}