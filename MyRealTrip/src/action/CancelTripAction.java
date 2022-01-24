package action;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.OrderListDao;
import com.join.vo.PayOrderListDto;

public class CancelTripAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		int pr_num = Integer.parseInt(request.getParameter("pr_num"));
		String pay_date = request.getParameter("pay_date");
		ArrayList<PayOrderListDto> orderList = new ArrayList<PayOrderListDto>();
		OrderListDao odao = new OrderListDao();
		RequestDispatcher rd = request.getRequestDispatcher("Controller?command=resultMyTrip");
		if(odao.cancelTrip(mem_num, pr_num , pay_date)) {
			orderList = odao.getOrderHistory(mem_num);
			request.setAttribute("orderList", orderList);
			rd.forward(request, response);
		}else {
			orderList = odao.getOrderHistory(mem_num);
			request.setAttribute("orderList", orderList);
			rd.forward(request, response);			
		}
	} 

}
