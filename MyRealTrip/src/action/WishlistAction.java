package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.join.vo.Common;
import com.join.vo.MemberDao;

public class WishlistAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		JSONArray jarr = new MemberDao().wishList(mem_num);
		response.setContentType("application/json; charset=utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=WishlistResultAction");
		request.setAttribute("wish_arr", jarr);
		request.setAttribute("mem_num", mem_num);
		rd.forward(request,response);
	}

}
