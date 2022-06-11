package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.order.OrderDAO;

public class MemberOrdering implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String orderNum = request.getParameter("orderNum");
		String res = request.getParameter("res");

		String msg = null;
		String goUrl = "Order";
		if(new OrderDAO().requestOrder(orderNum, res)) {
			if(res.equals("주문취소")) {
				msg = "주문이 취소되었습니다.";
			} else if(res.equals("주문취소요청")) {
				msg = "주문 취소가 요청되었습니다.";
			} else if(res.equals("반품요청")) {
				msg = "반품이 요청되었습니다";
			} else if(res.equals("교환요청")) {
				msg = "교환이 요청되었습니다";
			}
		} else {
			msg = "처리 실패";
		}
		
		
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "./member_view/memberAlert");
	}

}