package controller.notice;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;

@WebServlet("/notice/*")
public class NoticeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ArrayList<String> nonClass;

	public NoticeController() {
		super();
		nonClass = new ArrayList<String>();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String serviceStr = request.getRequestURI().substring((request.getContextPath() + "/notice/").length());
		System.out.println(serviceStr);

		if (nonClass.contains(serviceStr)) {
			request.setAttribute("noticeUrl", serviceStr);
		} else {
			try {

				Service service = (Service) Class.forName("service.noticePage." + serviceStr).newInstance();
				service.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/notices/noticeListpage.jsp");
		dispatcher.forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
