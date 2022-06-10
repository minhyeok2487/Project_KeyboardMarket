package service.commentPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.comment.CommentDAO;

public class CommentList implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int page = (int) request.getAttribute("nowPage");
		System.out.println(page);

		int limit = 10; // 한 페이지당 게시물 수
		int pageLimit = 5; // 페이지 번호 갯수


		int total = new CommentDAO().postCount();

		int pageTotal = total / limit;

		if (total % limit > 0) {
			pageTotal++;
		}

		int start = (page - 1) * limit;
		int pageStart = (page - 1) / pageLimit * pageLimit + 1;
		int pageEnd = pageStart + pageLimit - 1;

		if (pageEnd > pageTotal) {
			pageEnd = pageTotal;
		}
		
		Object dataList = new CommentDAO().list(start, limit);

		request.setAttribute("commentData", dataList);
		request.setAttribute("mainUrl", "./comments/commentListpage");

		request.setAttribute("start", start);
		request.setAttribute("limit", limit);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}

}
