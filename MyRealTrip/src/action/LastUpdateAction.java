package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.ProfileDao;

public class LastUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		String user_name = request.getParameter("user_name");
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		ProfileDao pdao = new ProfileDao();
		pdao.updateUser(user_name, mem_num);
		
		request.getRequestDispatcher("").forward(request, response);
		
		
	}

}
