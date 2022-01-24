package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/scannerclickServlet")
public class scannerclickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("application/json");
			response.setContentType("text/html;charset=UTF-8");
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id ="myrealtrip";
			String db_pw = "1234";
			JSONObject jsobj = new JSONObject();
			Connection conn = null;
			int country_num = Integer.parseInt(request.getParameter("country_num"));
			System.out.println(country_num);
			try{
				Class.forName(driver);
				conn = DriverManager.getConnection(url,db_id,db_pw);
				String sql = "select * from scanner where country_num=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, country_num);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					String conutry_name = rs.getString("COUNTRY_NAME");
					float injection = rs.getFloat("INJECTION");
					int new_patient = rs.getInt("NEW_PATIENT");
					String big_flags = rs.getString("BIG_FLAGS");
					String flags = rs.getString("FLAGS");
					jsobj.put("conutry_name", conutry_name);
					jsobj.put("injection", injection);
					jsobj.put("new_patient", new_patient);
					jsobj.put("big_flags", big_flags);
					jsobj.put("flags", flags);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			System.out.println(jsobj);
			out.print(jsobj);
			
			
			
			
			
			
			
			
			
			
	
	}

}

