package model.memberService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDTO;
import model.member.memberDAO;
import model.order.OrderDTO;

public class MemberOrderDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		memberDAO dao = new memberDAO();
		
		String oPage = request.getParameter("page");
		
		String oOrderNo = request.getParameter("orderNo");
		
		OrderDTO oDto = dao.orderSelect(Integer.parseInt(oOrderNo));
		
		
		itemDTO dto = dao.orderDetail(oDto.getItem_name());

		request.setAttribute("nowPage", oPage);
		request.setAttribute("dto", dto);
		request.setAttribute("orderDto", oDto);
		request.setAttribute("mainUrl", "member_view/OrderDetailForm");
	}
}
