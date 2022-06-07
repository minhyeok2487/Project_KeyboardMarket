package service.noticePage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.notice.NoticeDAO;

public class NoticeModifyForm implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int no = Integer.parseInt(request.getParameter("noticeNo"));
		NoticeDAO dao = new NoticeDAO();
		
		Object dataDetail = dao.detail(no);
		
		request.setAttribute("dto", dataDetail);
		request.setAttribute("noticeUrl", "NoticeModifyForm");
		
	}

}