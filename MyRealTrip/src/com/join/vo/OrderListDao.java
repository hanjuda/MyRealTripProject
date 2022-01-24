package com.join.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderListDao {
	Connection conn = new DBConnection().getConnection();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	public ArrayList<PayOrderListDto> getOrderHistory(int mem_num){
		ArrayList<PayOrderListDto> order = new ArrayList<PayOrderListDto>();
		String sql = "select * FROM seoul s, order_list o where s.pr_num = o.pr_num and mem_num= ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String pr_name = rs.getString("pr_name");
				String finalPrice = rs.getString("final_price");
				String reserveDate = rs.getString("reserve_date");
				String pay_date = rs.getString("pay_date");
				String request_pay = rs.getString("request_pay");
				String pr_img = rs.getString("image");
				int pr_num = rs.getInt("pr_num");
				order.add(new PayOrderListDto(pr_name,finalPrice,reserveDate,pay_date,request_pay,pr_img,pr_num));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
		
		
	}
	public boolean cancelTrip(int mem_num,int pr_num,String pay_date) {
		String sql = "delete from order_list where pr_num=? and  mem_num=? and pay_date =  TO_DATE(?, 'YYYY-MM-DD HH24:MI:SS')";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pr_num);
			pstmt.setInt(2, mem_num);
			pstmt.setString(3, pay_date);
			int ret = pstmt.executeUpdate();
			if(ret==1) {
				return true;
			}else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}			
		return false;
	}
	
	
	 public void completePayment(int pr_num,int mem_num,int quantity,String final_price,
			 String email,String phone_num,String request_pay,String reserve_date) {
		 try {
				String sql = "select * FROM member where mem_num =? and email = ? and phone_num=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, mem_num);
				pstmt.setString(2, email);
				pstmt.setString(3, phone_num);
				pstmt.executeQuery();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				String sql = "insert into order_list(pr_num,mem_num,quantity,final_price,reserve_date,request_pay) values(?,?,?,?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pr_num);
				pstmt.setInt(2, mem_num);
				pstmt.setInt(3, quantity);
				pstmt.setString(4, final_price);
				pstmt.setString(5, reserve_date);
				pstmt.setString(6, request_pay);
				pstmt.executeUpdate();
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	 }
	
	
		
	
	
	
}
