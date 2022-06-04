package service.noticePage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.notice.NoticeDAO;

public class NoticeDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("noticeNo"));
		
		NoticeDAO dao = new NoticeDAO();
		
		Object data = dao.detail(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("noticeUrl", "noticeDetail");
		System.out.println("NoticeDetail execute 실행!!" + data);
		
	}

}
