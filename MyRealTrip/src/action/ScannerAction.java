package action;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.vo.Common;
import com.join.vo.ScannerDao;
import com.join.vo.ScannerDto;

public class ScannerAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Common.header(request);
		ScannerDao sdao = new ScannerDao();
		ArrayList<ScannerDto> s_list =new ArrayList<ScannerDto>();
		
		String $vaccine=request.getParameter("$vaccine");
		if($vaccine==null) {
			$vaccine = "TRUE";
		}
		
		System.out.println($vaccine);
		s_list = sdao.getScannerList($vaccine);
		RequestDispatcher rd = request.getRequestDispatcher("scanner.jsp");
		request.setAttribute("$vaccine",$vaccine);
		request.setAttribute("s_list",s_list);
		rd.forward(request, response);
	}

}
