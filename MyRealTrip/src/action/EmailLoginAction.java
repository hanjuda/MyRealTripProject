package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.vo.Common;
import com.join.vo.MemberDao;

public class EmailLoginAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		MemberDao mdao = new MemberDao();
		String email = request.getParameter("email");
		String pw = request.getParameter("password");
		int mem_num = 0;
		mem_num = mdao.signIn(email, pw);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("email_sign_in_action.jsp");
		HttpSession session = request.getSession();
		request.setAttribute("mem_num", mem_num);
		rd.forward(request,response);	
	}
}
