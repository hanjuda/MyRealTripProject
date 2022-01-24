package action;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.join.vo.Common;
import com.join.vo.HomeDao;

public class SeoulAllAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		HomeDao hdao = new HomeDao();
		String cate_name = request.getParameter("cate_name");
		int product_count = hdao.countcate(cate_name);	
		int end = 18;
		int start = 1;
		JSONArray seoularr = hdao.seoularr(start, end, cate_name);
		response.setContentType("application/json; charset=utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=SeoulAllResultAction");
		request.setAttribute("seoularr", seoularr);
		request.setAttribute("product_count", product_count);
		rd.forward(request, response);
		
	}

}
