package action;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.OrderListDao;
import com.join.vo.PayOrderListDto;

public class MyTripAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		OrderListDao odao = new OrderListDao();
		
		ArrayList<PayOrderListDto> orderList = new ArrayList<PayOrderListDto>();
		
		orderList = odao.getOrderHistory(mem_num);
		
		RequestDispatcher rd = request.getRequestDispatcher("mytrip.jsp");
		request.setAttribute("orderList", orderList);
		rd.forward(request, response);
		
	}

}
