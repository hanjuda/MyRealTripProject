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

public class ProfileEditAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		JSONObject jobj = new ProfileDao().profileEdit(mem_num);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=ProfileEditResultAction");
		request.setAttribute("jobj", jobj);
		rd.forward(request, response);
		
		
	}

}
