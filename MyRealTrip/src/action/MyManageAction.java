package action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.join.vo.Common;
import com.join.vo.ProfileDao;

public class MyManageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		ProfileDao pdao = new ProfileDao();
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id ="myrealtrip";
		String db_pw = "1234";
		Connection conn = null;
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		JSONObject jobj = pdao.myManager(mem_num);
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=MyManagerResultAction");
		request.setAttribute("mana_jobj", jobj);
		rd.forward(request, response);
	}

}
