package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Checkagree;
import com.join.vo.Common;
import com.join.vo.InsertMemberDto;
import com.join.vo.MemberDao;

public class email_sign_up_sqlAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		Checkagree ch = new Checkagree();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String[] agree = request.getParameterValues("agree");
		
		String name= request.getParameter("name");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone_num = phone1+phone2+phone3;
	      
		int ch1= Integer.parseInt(agree[1]);
		int ch2= Integer.parseInt(agree[2]);
		int ch3= Integer.parseInt(agree[3]);
		int ch4= Integer.parseInt(agree[4]);
		MemberDao mdao = new MemberDao();
		int r = mdao.insertMember(new InsertMemberDto(name, email, pw, ch1, ch2, ch3,ch4, phone_num));
		request.setAttribute("r",r);
		request.getRequestDispatcher("email_sign_up_sql.jsp").forward(request, response);
	}

}
