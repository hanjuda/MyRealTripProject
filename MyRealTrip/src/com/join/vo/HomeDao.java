package com.join.vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.NumberFormat;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class HomeDao {
	
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public SeoulVO[] homeArr() {
		SeoulVO[] arr = new SeoulVO[586];
		String sql = "SELECT * FROM seoul";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int i=0;
			while(rs.next()){
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
				arr[i++] = new SeoulVO(pr_num,s_area,category,pr_name,category_area,company,type,time,meeting,price,dc_price,buytonow,image,finish_date,trip,seoul_tour);
			}
			rs.close();
			pstmt.close();   
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return arr;
	}
	
	public ArrayList<TraVO> traList(){
		ArrayList<TraVO> t_list = new ArrayList<TraVO>();
		String sql = "SELECT * FROM tra";	
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String tr = rs.getString("tr");
				String tr_image = rs.getString("tr_image");
				int tr_num = rs.getInt("tr_num");
				t_list.add(new TraVO(tr,tr_image,tr_num));
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return t_list;
	}
	
	
	public int countcate(String cate_name) {
		String sql = "select count(*) from seoul where category like ?";
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+cate_name+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public JSONArray seoularr(int start,int end,String cate_name) {
		JSONArray seoularr = new JSONArray();
		String sql = "select * from (select rownum rn,e.* from (select * FROM seoul where category like ?) e order by rownum desc) where ? <=rn and rn<= ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,'%'+cate_name+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject jobj = new JSONObject();
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
				jobj.put("pr_num", pr_num);
				jobj.put("s_area", s_area);
				jobj.put("category", category);
				jobj.put("pr_name", pr_name.replace("'", ""));
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
				seoularr.add(jobj);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return seoularr;
	}
	
	public JSONArray searchSeoul(String search) {
		JSONArray seoularr = new JSONArray(); 
		try {
			String sql = "SELECT * FROM seoul where pr_name like ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+search+'%');
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject jobj = new JSONObject();
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
				jobj.put("pr_num", pr_num);
				jobj.put("s_area", s_area);
				jobj.put("category", category);
				jobj.put("pr_name", pr_name.replace("'", ""));
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
				seoularr.add(jobj);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return seoularr;
	}
	
	public JSONObject productDetail(int p_num,String com_name) {
		JSONObject jobj = new JSONObject();
		try {
			String sql  = "SELECT * FROM seoul where pr_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String pr_name = rs.getString("pr_name");
				int price = rs.getInt("price");
				int dc_price = rs.getInt("dc_price");
				String company = rs.getString("company");
				com_name = company;
				jobj.put("pr_name",pr_name);
				jobj.put("price",price);
				jobj.put("dc_price",dc_price);
				jobj.put("company",company);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			String sql  = "SELECT * FROM course where course_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int course_num = rs.getInt("course_num");
				String course_name = rs.getString("course_name");
				String course_time = rs.getString("course_time");
				String course_content = rs.getString("course_content");
				String course_img = rs.getString("course_img");
				jobj.put("course_num",course_num);
				jobj.put("course_name",course_name);
				jobj.put("course_time",course_time);
				jobj.put("course_content",course_content);
				jobj.put("course_img",course_img);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		try {
			String sql  = "SELECT * FROM company where com_name = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,com_name);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String com_intro = rs.getString("com_intro");
				String com_image = rs.getString("com_image");
				jobj.put("com_intro", com_intro);
				jobj.put("com_image", com_image);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			String sql  = "SELECT * FROM detail where pr_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p_num);
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				int pr_num = rs.getInt("pr_num");
				int price_guarantee = rs.getInt("price_guarantee");
				int buytonow = rs.getInt("buytonow");
				int e_ticket =rs.getInt("e_ticket");
				String how_tour = rs.getString("how_tour");
				int lowest_people = rs.getInt("lowest_people");
				String how_to_move = rs.getString("how_to_move");
				String how_to_time = rs.getString("how_to_time");
				String lang_support = rs.getString("lang_support");
				String notice_title = rs.getString("notice_title");
				String notice_content = rs.getString("notice_content");
				int real_partner = rs.getInt("real_partner");
				String detail_img = rs.getString("detail_img");
				int option_select = rs.getInt("option_select");
				String product_img = rs.getString("product_img");
				String explain_title = rs.getString("explain_title");
				String explain_content = rs.getString("explain_content");
				String included = rs.getString("included");
				String disincluded = rs.getString("disincluded");
				String meet_time = rs.getString("meet_time");
				String using_time = rs.getString("using_time");
				String how_to_use = rs.getString("how_to_use");
				String more_info = rs.getString("more_info");
				String meet_place = rs.getString("meet_place");
				String meet_place_img = rs.getString("meet_place_img");
				String required_info = rs.getString("required_info");
				String loca_info = rs.getString("loca_info");
				String refund =rs.getString("refund");
				int product_number = rs.getInt("product_number");
				String how_many_price = rs.getString("how_many_price");
				String procedure = rs.getString("procedure");
				jobj.put("pr_num", pr_num);
				jobj.put("price_guarantee", price_guarantee);
				jobj.put("buytonow", buytonow);
				jobj.put("e_ticket", e_ticket);
				jobj.put("how_tour", how_tour);
				jobj.put("lowest_people", lowest_people);
				jobj.put("how_to_move", how_to_move);
				jobj.put("how_to_time", how_to_time);
				jobj.put("lang_support", lang_support);
				jobj.put("notice_title", notice_title);
				jobj.put("notice_content", notice_content);
				jobj.put("real_partner", real_partner);
				jobj.put("detail_img", detail_img);
				jobj.put("option_select", option_select);
				jobj.put("product_img", product_img);
				jobj.put("explain_title", explain_title);
				jobj.put("explain_content", explain_content);
				jobj.put("included", included);
				jobj.put("disincluded", disincluded);
				jobj.put("meet_time", meet_time);
				jobj.put("using_time", using_time);
				jobj.put("how_to_use", how_to_use);
				jobj.put("more_info", more_info);
				jobj.put("meet_place", meet_place);
				jobj.put("meet_place_img", meet_place_img);
				jobj.put("required_info", required_info);
				jobj.put("loca_info", loca_info);
				jobj.put("refund", refund);
				jobj.put("product_number", product_number);
				jobj.put("how_many_price", how_many_price);
				jobj.put("procedure", procedure);
			}
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jobj;
	}
	
	
	public JSONObject payment(int pr_num, int mem_num, int people_num, int price, int total_price,
							String reserve_date) {
		NumberFormat numberFormat = NumberFormat.getInstance();
		JSONObject jobj = new JSONObject();
		jobj.put("price",numberFormat.format(price));
		jobj.put("people_num",people_num);
		jobj.put("total_price",numberFormat.format(total_price));
		jobj.put("reserve_date",reserve_date);
		jobj.put("pr_num",pr_num);
		jobj.put("mem_num",mem_num);
		
		try {
			String sql = "SELECT * FROM seoul where pr_num = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pr_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String pr_name = rs.getString("pr_name");
				jobj.put("pr_name",pr_name);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		try {
			String sql = "SELECT * FROM member where mem_num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String phone_num = rs.getString("phone_num");
				jobj.put("name",name);
				jobj.put("email",email);
				jobj.put("phone_num",phone_num);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jobj;
		
	}
	
}
