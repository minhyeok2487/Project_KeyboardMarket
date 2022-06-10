package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.main.MainDAO;
import model.main.MainDTO;
import model.main.MainNoticeDAO;
import model.main.MainNoticeDTO;
import model.notice.NoticeDAO;
import model.notice.NoticeDTO;

public class AddMainNotice implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 주요공지사항 리스트
		ArrayList<MainNoticeDTO> NoticeList = new MainNoticeDAO().Currentlist();
		ArrayList<NoticeDTO> M_NoticeList = new ArrayList<NoticeDTO>();
		for (MainNoticeDTO res : NoticeList) {
			M_NoticeList.add(new NoticeDAO().detail(res.getNoticeNo()));
		}

		ArrayList<NoticeDTO> AllNoticeList = new NoticeDAO().AllList();
		for (int i = 0; i < AllNoticeList.size(); i++) {
			for (int j = 0; j < M_NoticeList.size(); j++) {
				if (AllNoticeList.get(i).getNoticeNo() == M_NoticeList.get(j).getNoticeNo()) {
					AllNoticeList.remove(i);
					i--;
				}
			}
		}

		request.setAttribute("AllNoticeList", AllNoticeList);
		request.setAttribute("mainUrl", "./admins/addMainnoticepage");

	}
}
