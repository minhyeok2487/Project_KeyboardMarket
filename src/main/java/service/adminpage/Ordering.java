package service.adminpage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.order.OrderDAO;


public class Ordering implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String orderNum = request.getParameter("orderNum");
		String res = request.getParameter("res");

		String msg = null;
		String goUrl = "Adminmain";
		if(new OrderDAO().requestOrder(orderNum, res)) {
			msg = "처리 완료";
		} else {
			msg = "처리 실패";
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "./admins/adminAlert");

	}
}
