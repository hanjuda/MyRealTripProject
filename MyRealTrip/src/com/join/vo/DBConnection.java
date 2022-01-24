package com.join.vo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	
	public static Connection getConnection(){
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id = "myrealtrip";
		String db_pw = "1234";
		
		Connection conn = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,db_id,db_pw);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
