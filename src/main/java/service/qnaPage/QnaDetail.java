package service.qnaPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.qna.QnaDAO;

public class QnaDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("qnaNo"));


		Object dataDetail = new QnaDAO().detail(id);

		request.setAttribute("dto", dataDetail);
		request.setAttribute("mainUrl", "./qnas/qnaDetailpage");

	}

}