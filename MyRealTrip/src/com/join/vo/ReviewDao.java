package com.join.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONObject;

public class ReviewDao {
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public JSONObject writeReview(int pr_num,int star_co,int mem_num,
				String review_content, String review_img) {
		JSONObject reviewobj = new JSONObject();
		try {
			String sql = "INSERT INTO REVIEW(pr_num,review_num,star_co,mem_num,review_content,review_img) values(?,SEQ_REVIEW_NUM.NEXTVAL,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pr_num);
			pstmt.setInt(2, star_co);
			pstmt.setInt(3, mem_num);
			pstmt.setString(4, review_content);
			pstmt.setString(5, review_img);
			int r = pstmt.executeUpdate();
			if(r!=0) {
				reviewobj.put("star_co",star_co);
				reviewobj.put("review_content", review_content);
				reviewobj.put("review_img",review_img);
			}
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		try {
			String sql = "SELECT * FROM member where mem_num = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				reviewobj.put("name",name);				
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return reviewobj;
	}
}
