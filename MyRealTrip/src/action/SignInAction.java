package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;

public class SignInAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=SignInResultAction");
		rd.forward(request, response);
		
	}

}
