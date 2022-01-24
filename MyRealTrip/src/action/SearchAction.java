package action;

import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.join.vo.Common;
import com.join.vo.HomeDao;

public class SearchAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		String search = request.getParameter("search");
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String db_id ="myrealtrip";
		String db_pw = "1234";
		Connection conn = null;
		JSONArray seoularr = new HomeDao().searchSeoul(search);
		
	
			
			
		response.setContentType("application/json; charset=utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=SeoulAllResultAction");
		request.setAttribute("seoularr", seoularr);
		rd.forward(request, response);	
								
	}

}
