package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mainpage/*")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ArrayList<String> nonClass;

	public MainController() {
		super();
		nonClass = new ArrayList<String>();
		nonClass.add("pages");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String serviceStr = request.getRequestURI().substring((request.getContextPath() + "/mainpage/").length());
		System.out.println(serviceStr);
		if (nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", "/main/"+serviceStr);
		} else {
			try {
				Service service = (Service) Class.forName("model.mainService.Main" + serviceStr).newInstance();
				service.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/template.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}