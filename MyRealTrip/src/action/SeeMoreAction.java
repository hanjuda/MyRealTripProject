package action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.join.vo.Common;

public class SeeMoreAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		String toShow = request.getParameter("toShow");
		System.out.println(toShow);
		int infi_start = 0;
		int infi_end = 0;
		try {
			infi_start = Integer.parseInt(request.getParameter("infi_start"));
			infi_end = Integer.parseInt(request.getParameter("infi_end"));			
		}catch(Exception e){
			e.printStackTrace();
		}
		int start = 1 +infi_start;
		int end = 12 + infi_end;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id ="myrealtrip";
		String db_pw = "1234";
		
		Connection conn = null;
		
		JSONArray backArr = new JSONArray();
		JSONArray productArr = new JSONArray();
		JSONArray seemoreArr = new JSONArray();
		
		
		try {
			String sql = "select * FROM see_more ";
			if(toShow.equals("snap")) {
				sql += " where see_name like '%"+toShow+"%'"; 
			}else if(toShow.equals("class")) {
				sql += " where see_name like '%"+toShow+"%'";
			}else if(toShow.equals("restrant")) {
				sql += " where see_name like '%"+toShow+"%'";
			}else if(toShow.equals("activity")) {
				sql += " where see_name like '%"+toShow+"%'";
			}else if(toShow.equals("date")) {
				sql += " where see_name like '%"+toShow+"%'";
			}
			Class.forName(driver);
			conn = DriverManager.getConnection(url,db_id,db_pw);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				JSONObject jobj = new JSONObject();
				String see_name = rs.getString("see_name");
				String backgroundImg = rs.getString("background_img");
				String span1 = rs.getString("span1");
				String span2 = rs.getString("span2");
				jobj.put("see_name", see_name);
				jobj.put("backgroundImg", backgroundImg);
				jobj.put("span1", span1);
				jobj.put("span2", span2);
				jobj.put("toShow", toShow);
				backArr.add(jobj);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		try{
			
			String sql = "select * from (select rownum rn,e.* from (select * FROM seoul ";
			if(toShow.equals("snap")) {
				sql += " where category like '%스냅%' "; 
			}else if(toShow.equals("class")) {
				sql += " where category like '%클래스%' ";
			}else if(toShow.equals("restrant")) {
				sql += " where category like '%미식%' ";
			}else if(toShow.equals("activity")) {
				sql += " where category like '%액티비티%' ";
			}else if(toShow.equals("date")) {
				sql += " where seoul_tour like '%즐길거리%' ";
			}
			sql += ") e order by rownum desc) where ? <=rn and rn<= ?";
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url,db_id,db_pw);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject jobj = new JSONObject();
				int pr_num = rs.getInt("pr_num");
				String s_area = rs.getString("s_area");
				String category = rs.getString("category");
				String pr_name = rs.getString("pr_name").replace("'", "");
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
				jobj.put("pr_num",pr_num);
				jobj.put("s_area",s_area);
				jobj.put("category",category);
				jobj.put("pr_name",pr_name);
				jobj.put("category_area",category_area);
				jobj.put("company",company);
				jobj.put("meeting",meeting);
				jobj.put("price",price);
				jobj.put("dc_price",dc_price);
				jobj.put("buytonow",buytonow);
				jobj.put("image",image);
				jobj.put("finish_date",finish_date);
				jobj.put("trip",trip);
				jobj.put("seoul_tour",seoul_tour);
				productArr.add(jobj);		
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		response.setContentType("application/json; charset=utf-8");
		RequestDispatcher rd = null;
		if(toShow.equals("snap")) {
			rd = request.getRequestDispatcher("Controller?command=SnapMoreResultAction");
		}else if(toShow.equals("class")) {
			rd = request.getRequestDispatcher("Controller?command=ClassMoreResultAction");			
		}else if(toShow.equals("restrant")) {
			rd = request.getRequestDispatcher("Controller?command=RestrantMoreResultAction");
		}else if(toShow.equals("activity")) {
			rd = request.getRequestDispatcher("Controller?command=ActivityMoreResultAction");
		}else if(toShow.equals("date")) {
			rd = request.getRequestDispatcher("Controller?command=DateMoreResultAction");			
		}
		
		seemoreArr.add(backArr);
		seemoreArr.add(productArr);
		if(infi_start==0) {
			request.setAttribute("seemoreArr", seemoreArr);
			rd.forward(request, response);			
		}else{
			PrintWriter out = response.getWriter();
			out.print(productArr);
		}
	}
}
