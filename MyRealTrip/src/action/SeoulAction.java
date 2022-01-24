package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.HomeDao;
import com.join.vo.SeoulVO;

public class SeoulAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		HomeDao hdao = new HomeDao(); 
		SeoulVO[] arr = hdao.homeArr();
		
		RequestDispatcher rd = request.getRequestDispatcher("seoul.jsp");
		request.setAttribute("seoulArr", arr);
		request.setAttribute("t_list", hdao.traList());
		rd.forward(request,response);
	}

}
