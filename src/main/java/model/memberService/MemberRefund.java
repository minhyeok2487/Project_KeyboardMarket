package model.memberService;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDTO;
import model.member.memberDAO;
import model.order.OrderDAO;
import model.order.OrderDTO;

public class MemberRefund implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String aStatus = request.getParameter("status");
		
		
		String oPage = request.getParameter("page");
		String oOrderNo = request.getParameter("orderNo");
		
		OrderDTO oDto = new memberDAO().orderSelect(Integer.parseInt(oOrderNo));
		
		if(oDto.getRefund()!=null) {
			String refund = oDto.getRefund();
			request.setAttribute("refund", refund);
		}
		
		if(oDto.getRefund_date()!=null) {
			Date refund_date = oDto.getRefund_date();
			request.setAttribute("refund_date", refund_date);
		}
		
		itemDTO dto = new memberDAO().orderDetail(oDto.getItem_name());
		
		new OrderDAO().requestRefund(oOrderNo, aStatus);
		
		request.setAttribute("nowPage", oPage);
		request.setAttribute("dto", dto);
		request.setAttribute("orderDto", oDto);
		request.setAttribute("mainUrl", "member_view/OrderDetailForm");
	}
}
