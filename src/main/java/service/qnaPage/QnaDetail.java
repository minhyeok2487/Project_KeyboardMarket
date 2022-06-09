package service.qnaPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.qna.QnaDAO;

public class QnaDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("qnaNo"));

		QnaDAO dao = new QnaDAO();

		Object dataDetail = dao.detail(id);

		request.setAttribute("dto", dataDetail);
		request.setAttribute("mainUrl", "./qnas/qnaDetailpage");

	}

}