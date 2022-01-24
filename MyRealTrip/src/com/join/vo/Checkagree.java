package com.join.vo;

public class Checkagree extends Object {
	
	public Checkagree(){}
	
	public int check(String[] agree,String a) {
		int b=0;
		for(int i=0;i<agree.length;i++){
			if(agree[i].equals(b)){
				b=1;
			}
			else b= 0;
		}
		return b;
	}
	
	
}
