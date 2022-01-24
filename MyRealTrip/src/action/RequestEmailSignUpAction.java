package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;

public class RequestEmailSignUpAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		response.sendRedirect("email_sign_up.jsp");
	}

}
