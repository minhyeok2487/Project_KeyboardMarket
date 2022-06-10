package service.adminpage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.main.MainDAO;
import model.main.MainNoticeDAO;

public class RemoveMainNotice implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String msg = null;
		String goUrl = "MainControl";
		if(new MainNoticeDAO().removeitem(noticeNo)) {
			msg = "주요공지가 내려갔습니다.";
		} else {
			msg = "처리 실패";
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "./admins/adminAlert");
	}
}
