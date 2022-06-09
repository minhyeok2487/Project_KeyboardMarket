package service.noticePage;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Service;
import model.member.memberDTO;
import model.notice.NoticeDAO;
import model.notice.NoticeDTO;

public class NoticeInsertReg implements Service {

	@SuppressWarnings("deprecation")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String msg = null;
		String path = request.getRealPath("uploadFiles");
		path = "/Users/shk/Downloads/Web_Project/4th_Project/Project_KeyboardMarket/src/main/webapp/uploadFiles";
		int size = 10 * 1024 * 1024;
		MultipartRequest mr = null;
		HttpSession session = request.getSession();
		memberDTO mDTO = (memberDTO) session.getAttribute("inUser");
		String id = mDTO.getUser_id();

		try {
			mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			NoticeDTO dto = new NoticeDTO();
			dto.setSubject(mr.getParameter("subject"));
			dto.setUser_id(id);
			dto.setPname(mr.getParameter("pname"));
			dto.setContent(mr.getParameter("content"));
			dto.setUpfile(mr.getFilesystemName("upfile"));
			msg = "공지사항을 작성했어요 :)";
			new NoticeDAO().insert(dto);
			System.out.println(dto);

		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("예외가 출력~");
			msg = "공지사항을 작성하지 못했어요 ㅠㅠ";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "./notices/noticeAlert");
		request.setAttribute("goUrl", "NoticeList");
	}
}
