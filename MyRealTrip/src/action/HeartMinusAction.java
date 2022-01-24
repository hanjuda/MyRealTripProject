package action;

import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.MemberDao;

public class HeartMinusAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		MemberDao mdao = new MemberDao();
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		int pr_num = Integer.parseInt(request.getParameter("wish_num"));
		mdao.removeHeart(mem_num, pr_num);
	}

}
