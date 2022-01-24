package action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.ProfileDao;

public class PointAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id ="myrealtrip";
		String db_pw = "1234";
		Connection conn = null;
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		int point = new ProfileDao().getPoint(mem_num);
		
		PrintWriter out = response.getWriter();
		out.print(point);
		
	}

}
