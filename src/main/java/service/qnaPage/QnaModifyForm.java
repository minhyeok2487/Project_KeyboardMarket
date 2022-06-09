package service.qnaPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.qna.QnaDAO;

public class QnaModifyForm implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int no = Integer.parseInt(request.getParameter("qnaNo"));
		QnaDAO dao = new QnaDAO();

		Object dataDetail = dao.detail(no);

		request.setAttribute("dto", dataDetail);
		request.setAttribute("mainUrl", "./qnas/qnaModifypage");

	}

}