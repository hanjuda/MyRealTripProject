package com.join.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONObject;

public class ProfileDao {
	Connection conn= DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public void updateUser(String user_name, int mem_num) {
		String sql = "UPDATE member set name = ? where mem_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setInt(2, mem_num);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public JSONObject myManager(int mem_num) {
		JSONObject jobj = new JSONObject();
		String sql = "select * from member where mem_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String email = rs.getString("email");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				int agree_1 = rs.getInt("agree_1");
				int agree_2 = rs.getInt("agree_2");
				int agree_3 = rs.getInt("agree_3");
				int agree_4 = rs.getInt("agree_4");
				String phone_num = rs.getString("phone_num");
				String psa = rs.getString("psa");
				int point = rs.getInt("point");
				jobj.put("email", email);
				jobj.put("name", name);
				jobj.put("pw", pw);
				jobj.put("agree_1", agree_1);
				jobj.put("agree_2", agree_2);
				jobj.put("agree_3", agree_3);
				jobj.put("agree_4", agree_4);
				jobj.put("phone_num", phone_num);
				jobj.put("psa", psa);
				jobj.put("point", point);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			
		}
		return jobj;
	}
	
	public int getPoint(int mem_num) {
		int point = 0;
		try {
			String sql = "select point from member where mem_num = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				point = rs.getInt("point");
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			point +=2000;
			String sql = "UPDATE member set point = ? where mem_num = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,point);
			pstmt.setInt(2,mem_num);
			pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return point;
	}
	
	
	public JSONObject profileEdit(int mem_num) {
		String sql = "select * FROM member where mem_num = ?";
		JSONObject jobj = new JSONObject();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String email = rs.getString("email");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				int agree_1 = rs.getInt("agree_1");
				int agree_2 = rs.getInt("agree_2");
				int agree_3 = rs.getInt("agree_3");
				int agree_4 = rs.getInt("agree_4");
				String phone_num = rs.getString("phone_num");
				String last_date = rs.getString("last_date");
				String psa = rs.getString("psa");
				int point = rs.getInt("point");
				jobj.put("email", email);
				jobj.put("name", name);
				jobj.put("pw", pw);
				jobj.put("agree_1", agree_1);
				jobj.put("agree_2", agree_2);
				jobj.put("agree_3", agree_3);
				jobj.put("agree_4", agree_4);
				jobj.put("phone_num", phone_num);
				jobj.put("psa", psa);
				jobj.put("point", point);
				jobj.put("last_date", last_date);
				jobj.put("mem_num", mem_num);
				jobj.put("edit", 1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jobj;
	}
	
	
	
	
}
