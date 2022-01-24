package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;

public class RequestClassMoreAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		request.getRequestDispatcher("seoul_more.jsp").forward(request, response);
	}

}
