package service.qnaPage;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.Service;
import model.member.memberDTO;
import model.qna.QnaDAO;
import model.qna.QnaDTO;

public class QnaInsertReg implements Service {

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
		int memberNum = mDTO.getMemberNo();
		String getId = mDTO.getUser_id();

		try {
			mr = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
			QnaDTO dto = new QnaDTO();
			dto.setSubject(mr.getParameter("subject"));
			dto.setUser_id(getId);
			dto.setPname(mr.getParameter("pname"));
			dto.setContent(mr.getParameter("content"));
			dto.setMemberNo(memberNum);
			msg = "게시글을 작성했어요 :)";
			new QnaDAO().insert(dto);
//			System.out.println(dto);

		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("예외가 출력~");
			msg = "게시글을 작성하지 못했어요 ㅠㅠ";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "./qnas/qnaAlert");
		request.setAttribute("goUrl", "QnaList");
	}
}
