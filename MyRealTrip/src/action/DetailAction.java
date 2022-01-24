package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.join.vo.HomeDao;

public class DetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int p_num = 1;
		try {
			p_num = Integer.parseInt(request.getParameter("pr_num"));
		}catch(Exception e) {
			e.printStackTrace();
			p_num = 1;
		}
		String com_name = "가이드쿱";
		
		
		JSONObject jobj = new HomeDao().productDetail(p_num, com_name);
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		request.setAttribute("jobj", jobj);
		rd.forward(request, response);
		
		
	}

}
