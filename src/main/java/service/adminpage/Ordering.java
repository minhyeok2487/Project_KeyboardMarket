package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.member.memberDAO;
import model.order.OrderDAO;
import model.order.OrderDTO;


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
		
		if(res.equals("배송완료")) {
			ArrayList<OrderDTO> OrderList = new OrderDAO().SearchOrederedNum(orderNum);
			for(OrderDTO order:OrderList) {
				int itemNo = order.getItemNo();
				int count = order.getSelect_count();
				int stock = new itemDAO().Detail(itemNo).getStock() - count;
				new itemDAO().Sell(itemNo, stock);
			}
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "./admins/adminAlert");

	}
}
