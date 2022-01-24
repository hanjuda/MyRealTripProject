package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.join.vo.ReviewDao;

public class ReviewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pr_num = Integer.parseInt(request.getParameter("pr_num"));
		int star_co = Integer.parseInt(request.getParameter("star_co"));
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		String review_content = request.getParameter("review_content");
		String review_img = request.getParameter("review_img");
		
		JSONObject reviewobj = new ReviewDao().writeReview(pr_num, star_co, mem_num, review_content, review_img);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(reviewobj);
	}

}
