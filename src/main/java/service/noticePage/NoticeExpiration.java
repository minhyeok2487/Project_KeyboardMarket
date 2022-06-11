package service.noticePage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.notice.NoticeDAO;
import model.notice.NoticeDTO;

public class NoticeExpiration implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int no = Integer.parseInt(request.getParameter("noticeNo"));
		String msg = null;

		new NoticeDAO().expirationUpdate(no);
		msg = "만료처리가 되었습니다.";
		
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "./notices/noticeAlert");
		request.setAttribute("goUrl", "NoticeList");
	}

}
