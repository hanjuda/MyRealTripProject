package action;

import java.text.NumberFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.join.vo.HomeDao;

public class PaymentAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NumberFormat numberFormat = NumberFormat.getInstance();
		int pr_num = Integer.parseInt(request.getParameter("pr_num"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		int people_num = Integer.parseInt(request.getParameter("people_num"));
		int price = Integer.parseInt(request.getParameter("price"));
		int total_price =price * people_num; 
		String reserve_date = request.getParameter("reserve_date");
		JSONObject jobj = new HomeDao().payment(pr_num, mem_num, people_num, price, total_price, reserve_date);
		RequestDispatcher rd = request.getRequestDispatcher("payment.jsp");
		request.setAttribute("jobj",jobj);
		rd.forward(request, response);
		
		
	}

}
