package service.noticePage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.notice.NoticeDAO;

public class NoticeList implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int start = 1;
		int limit = 3;

		Object dataList = new NoticeDAO().list();

		request.setAttribute("noticeData", dataList);
		request.setAttribute("mainUrl", "./notices/noticeListpage");
	}

}
