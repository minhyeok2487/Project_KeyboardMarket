package service.noticePage;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Service;
import model.notice.NoticeDAO;
import model.notice.NoticeDTO;

public class NoticeInsertReg implements Service {

	@SuppressWarnings("deprecation")
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("uploadFiles");
		path = "/Users/shk/Downloads/Web_Project/4th_Project/Project_KeyboardMarket/src/main/webapp/uploadFiles";
		int size = 10 * 1024 * 1024;
		MultipartRequest mr = null;
		
		try {
			mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			NoticeDTO dto = new NoticeDTO();
			dto.setSubject(mr.getParameter("subject"));
			dto.setPname(mr.getParameter("pname"));
			dto.setContent(mr.getParameter("content"));
			dto.setUpfile(mr.getFilesystemName("upfile"));
			
			new NoticeDAO().insert(dto);
			System.out.println(dto);
			
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("예외가 출력~");
		}
		

		request.setAttribute("msg", "작성되었어요 :)");
		request.setAttribute("goUrl", "noticeListpage");
		request.setAttribute("NoticeUrl", "alert");
//		System.out.println("NoticeInsertReg 실행!!");
	}
}
