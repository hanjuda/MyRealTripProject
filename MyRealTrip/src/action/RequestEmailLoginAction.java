package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;

public class RequestEmailLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		//int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		RequestDispatcher rd = request.getRequestDispatcher("email_sign_in_action.jsp");
		//request.setAttribute("mem_num", mem_num);
		rd.forward(request, response);
	}

}
