package action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.join.vo.Common;

public class InfiSeoulAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id ="myrealtrip";
		String db_pw = "1234";
		Connection conn = null;
		int infi_end = Integer.parseInt(request.getParameter("infi_end"));
		int infi_start = Integer.parseInt(request.getParameter("infi_start"));
		int end = 18+infi_end;
		int start = 1+infi_start;
		JSONArray seoularr = new JSONArray(); 
		String cate_filter = "_";
		try {
			cate_filter = request.getParameter("cate_filter");
		}catch(Exception e) {
			e.printStackTrace();
			cate_filter = "_";
		}
		
		
		int price_end = Integer.parseInt(request.getParameter("price_end"));
		int price_start = Integer.parseInt(request.getParameter("price_start"));
		String radio_tour="";
		try {
			radio_tour = request.getParameter("radio_tour");
		}catch(Exception e) {
			e.printStackTrace();;
			radio_tour="";
		}
		String radio_time="";
		try {
			radio_time = request.getParameter("radio_time");
		}catch(Exception e) {
			e.printStackTrace();;
			radio_time="";
		}
		
		String radio_meet="";
		try {
			radio_meet = request.getParameter("radio_meet");
		}catch(Exception e) {
			e.printStackTrace();
			radio_meet="";
		}
		
		int buynow = 0;
		try {
			buynow = Integer.parseInt(request.getParameter("buytonow"));
		}catch(Exception e) {
			buynow = 0;
		}
		
		String[] checking = null;
		try {
			checking = request.getParameterValues("checking");
		}catch(Exception e) {
			e.printStackTrace();
			checking = null;
		}
		
		
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,db_id,db_pw);
			String sql = "select * from (select rownum rn,e.* from (SELECT * FROM SEOUL where category like ? and price < ? and ? < price and type like ? "
					+" and time like ? ";
			if(radio_meet.equals("")) {
				sql+="";
			}
			else if(radio_meet.equals("오전")) {
				sql+= " and meeting = '오전'";
			}else if(radio_meet.equals("오후")) {
				sql+= " and meeting = '오후'";
			}else if(radio_meet.equals("저녁")) {
				sql+= " and meeting = '저녁'";
			}else {
				sql+="";
			}
			
			if(buynow==1) {
				sql += " and buytonow = 1";
			}else {
				sql += "";
			}
			
			if(checking==null) {
				sql +="";
			}else {
				String checksql = "";
				for(int i=0;i<checking.length;i++) {
					if(i==checking.length-1) {
						checksql += "'"+checking[i]+"'";	
					}else {
						checksql += "'"+checking[i]+"' , ";
					}
				}
				System.out.println(checksql);
				sql +=" and trip in ("+checksql+") ";				
			}
			
			System.out.println("InfiSeoulAction - cate_filter : " + cate_filter);

			sql+=") e order by rownum desc) where ? <=rn and rn<= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,'%'+cate_filter+'%');
			pstmt.setInt(2,price_end);
			pstmt.setInt(3,price_start);
			pstmt.setString(4,'%'+radio_tour+'%');
			pstmt.setString(5,'%'+radio_time+'%');
			pstmt.setInt(6, start);
			pstmt.setInt(7, end);
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
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		conn.close();
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(seoularr);
		
		
		
		
	}

}
