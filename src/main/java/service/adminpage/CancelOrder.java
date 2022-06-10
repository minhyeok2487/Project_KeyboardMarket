package service.adminpage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.order.OrderDAO;

public class CancelOrder implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int order_No = Integer.parseInt(request.getParameter("orderNo"));
		int item_No = Integer.parseInt(request.getParameter("itemNo"));
		
		new OrderDAO().cancelOrder(order_No, item_No);
		
		
		
	}

}
