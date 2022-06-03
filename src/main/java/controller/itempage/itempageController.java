package controller.itempage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;

@WebServlet("/itemPages/*")
public class itempageController extends HttpServlet {

	ArrayList<String> nonClass;

	public itempageController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String serviceStr = request.getRequestURI().substring((request.getContextPath() + "/itemPages/").length());
		//System.out.println(serviceStr);
		try {
			Service service = (Service) Class.forName("service.itempage."+serviceStr).newInstance();
			service.execute(request, response);
			
			if(serviceStr.equals("itemList")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/items/itempage.jsp");
				dispatcher.forward(request, response);
			}else if(serviceStr.equals("itemdetail")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/items/detailpage.jsp");
				dispatcher.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
