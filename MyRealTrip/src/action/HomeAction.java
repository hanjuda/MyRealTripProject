package action;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.join.vo.Common;
import com.join.vo.HomeDao;
import com.join.vo.MemberDao;
import com.join.vo.SeoulVO;

public class HomeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		HomeDao hdao = new HomeDao(); 
		SeoulVO[] arr = hdao.homeArr();
		MemberDao mdao = new MemberDao();
		int mem_num=0;
		try {
			HttpSession session = request.getSession();
			mem_num = (int) session.getAttribute("mem_num");
		}catch(Exception e) {
			e.printStackTrace();
		}
		int user_coupon = mdao.couponCount(mem_num);
		
		RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		request.setAttribute("seoulArr", arr);
		
		if(mem_num!=0) {
			request.setAttribute("user_Info", mdao.userInfo(mem_num));
			request.setAttribute("coupon_count", user_coupon);
		}
		
		
		rd.forward(request, response);
		
		
		
	}
	
}
