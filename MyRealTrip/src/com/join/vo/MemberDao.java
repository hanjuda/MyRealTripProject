package com.join.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class MemberDao {

	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	public MemberDto userInfo(int mem_number) {
		MemberDto dto = null;
		String sql = "SELECT * FROM member where mem_num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int mem_num = rs.getInt("mem_num");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String pw = rs.getString("pw");
				String phone_num = rs.getString("phone_num");
				String last_date = rs.getString("last_date");
				int point = rs.getInt("point");
				dto = new MemberDto(mem_num,email,name,pw,phone_num,last_date,point);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	public int insertMember(InsertMemberDto dto) {
		String sql = "INSERT INTO member(MEM_NUM,name,email,PW,AGREE_1,AGREE_2,AGREE_3,AGREE_4,phone_num)"+
				" VALUES(SEQ_MEM_NUM.NEXTVAL,?,?,?,?,?,?,?,?)";
		int r = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getEmail());
			pstmt.setString(3,dto.getPw());
			pstmt.setInt(4,dto.getCh1());
			pstmt.setInt(5,dto.getCh2());
			pstmt.setInt(6,dto.getCh3());
			pstmt.setInt(7,dto.getCh4());
			pstmt.setString(8,dto.getPhone_num());
			r = pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
			r=0;
		}
		return r;
	}
	
	
	
	
	public int couponCount(int mem_num) {
		int user_coupon_count = 0;
		String sql = "SELECT count(coupon_num) FROM mem_coupon where mem_num = ? ";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mem_num);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user_coupon_count = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
		}
		return user_coupon_count;
	}
	
	public int signIn(String email, String pw) {
		int mem_num=0;
		String sql = "SELECT * FROM member where email=? and pw=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mem_num = rs.getInt("mem_num");
			}else {
				mem_num = 0;
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mem_num;
	}
	
	public void removeHeart(int mem_num,int pr_num) {
		
		String sql = "DELETE FROM wishlist where mem_num=? and pr_num=?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mem_num);
			pstmt.setInt(2,pr_num);	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addHeart(int mem_num,int pr_num) {
		
		String sql = "insert into wishlist(mem_num,pr_num) values(?,?)";
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mem_num);
			pstmt.setInt(2,pr_num);	
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public JSONArray wishList(int mem_num) {
		JSONArray jarr =new JSONArray();
		ArrayList<Integer> pr_num_list = new ArrayList<Integer>();
		try{
			String sql = "SELECT * FROM wishlist where mem_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,mem_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int pr_num = rs.getInt("pr_num");
				pr_num_list.add(pr_num);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0 ;i<pr_num_list.size();i++) {
			try{
				String sql = "SELECT * FROM seoul where pr_num=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,pr_num_list.get(i));
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int pr_num = rs.getInt("pr_num");
					String s_area = rs.getString("s_area");
					String category = rs.getString("category");
					String pr_name = rs.getString("pr_name");
					String category_area = rs.getString("category_area");
					String company = rs.getString("company");
					String type = rs.getString("type");
					String time =  rs.getString("time");
					String meeting = rs.getString("meeting");
					int price = rs.getInt("price");
					int dc_price = rs.getInt("dc_price");
					int buytonow =  rs.getInt("buytonow");
					String image = rs.getString("image");
					String finish_date = rs.getString("finish_date");
					String trip = rs.getString("trip");
					String seoul_tour = rs.getString("seoul_tour");
					JSONObject jobj = new JSONObject();
					jobj.put("pr_num", pr_num);
					jobj.put("s_area", s_area);
					jobj.put("category", category);
					jobj.put("pr_name", pr_name);
					jobj.put("category_area", category_area);
					jobj.put("company", company);
					jobj.put("type", type);
					jobj.put("time", time);
					jobj.put("meeting", meeting);
					jobj.put("price", price);
					jobj.put("dc_price", dc_price);
					jobj.put("image", image);
					jobj.put("finish_date", finish_date);
					jobj.put("trip", trip);
					jobj.put("buytonow", buytonow);
					jobj.put("seoul_tour", seoul_tour);
					jarr.add(jobj);
				}	
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return jarr;
	}
	
	
	
}
