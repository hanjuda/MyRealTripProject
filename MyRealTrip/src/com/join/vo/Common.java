package com.join.vo;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Common {
	
	Connection conn = DBConnection.getConnection();
	
	public static void header(HttpServletRequest request) {
		int mem_num = 0;
		try {
			HttpSession session = request.getSession();
			mem_num = (Integer)session.getAttribute("mem_num");
		}catch(Exception e) {
		}
		MemberDao mdao = new MemberDao();
		if(mem_num!=0) {
			int user_coupon = mdao.couponCount(mem_num);
			int user_point = mdao.userInfo(mem_num).getPoint();
			String user_name = mdao.userInfo(mem_num).getName();
			request.setAttribute("user_coupon", user_coupon);
			request.setAttribute("user_point", user_point);
			request.setAttribute("user_name", user_name);
		}
	}
	
}
