package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.notice.NoticeDAO;
import model.notice.NoticeDTO;

public class NoticeControl implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO dao = new NoticeDAO();
		
		//1.게시된 리스트
		ArrayList<NoticeDTO> PostList = dao.Currentlist("게시");
		//2.만료된 리스트
		ArrayList<NoticeDTO> EndList = dao.Currentlist("만료");
		
		request.setAttribute("PostList", PostList);
		request.setAttribute("EndList", EndList);
		request.setAttribute("mainUrl", "./admins/noticecontrolpage");
		
	}
}
