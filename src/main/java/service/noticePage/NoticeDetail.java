package service.noticePage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.notice.NoticeDAO;

public class NoticeDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("noticeNo"));

		Object dataDetail = new NoticeDAO().detail(id);

		request.setAttribute("dto", dataDetail);
		request.setAttribute("mainUrl", "./notices/noticeDetailpage");

	}

}