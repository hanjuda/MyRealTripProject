package com.join.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ScannerDao {
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ScannerDto> getScannerList(String $vaccine){
		 ArrayList<ScannerDto> s_list =new ArrayList<ScannerDto>();
		String sql = "select * from Scanner where vaccine = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,$vaccine);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int country_num = rs.getInt("country_num");
				String country_name = rs.getString("country_name");
				String vaccine = rs.getString("vaccine");
				String trip_possible = rs.getString("trip_possible");
				int injection = rs.getInt("injection");
				int new_patient = rs.getInt("new_patient");
				String big_flags = rs.getString("big_flags");
				String flags= rs.getString("flags");
				s_list.add(new ScannerDto(country_num, country_name, vaccine, trip_possible, injection, new_patient, big_flags, flags));
			}	
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return s_list;
	}
	
}
