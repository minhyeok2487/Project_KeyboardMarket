package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.main.MainDAO;
import model.main.MainNoticeDAO;
import model.notice.NoticeDAO;
import model.notice.NoticeDTO;
import model.order.OrderDAO;
import model.order.OrderDTO;

public class AddMainNoticeReg implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		NoticeDTO dto = new NoticeDAO().detail(noticeNo);
		String msg = null;
		String goUrl = "MainControl";
		if(new MainNoticeDAO().insert(dto)) {
			msg = "처리 성공";
		} else {
			msg = "처리 실패";
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "./admins/adminAlert");
	}
}
