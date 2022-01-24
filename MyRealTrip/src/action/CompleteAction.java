package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.join.vo.OrderListDao;

public class CompleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//결제완료
		int pr_num = Integer.parseInt(request.getParameter("pr_num"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num")); 
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String final_price = request.getParameter("final_price");
		String email = request.getParameter("email");
		String phone_num = request.getParameter("phone_num");
		String request_pay = request.getParameter("request_pay");
		String reserve_date = request.getParameter("reserve_date");
		new OrderListDao().completePayment(pr_num, mem_num, quantity, final_price, email, phone_num, request_pay, reserve_date);
		
		
		response.setContentType("application/json; charset=UTF-8");
		JSONObject jobj = new JSONObject();
		jobj.put("data","결제완료!");
		PrintWriter out = response.getWriter();
		out.print(jobj);
	}

}
