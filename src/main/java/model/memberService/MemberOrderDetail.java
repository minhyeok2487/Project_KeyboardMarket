package model.memberService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDTO;
import model.member.memberDAO;

public class MemberOrderDetail implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		memberDAO dao = new memberDAO();
		
		String oItem_name = request.getParameter("item_name");
		String oOrdered_date = request.getParameter("ordered_date");
		String oStatus = request.getParameter("status");
		String oPage = request.getParameter("page");
		String oSelect_count = request.getParameter("select_count");
		
		
		itemDTO dto = dao.orderDetail(oItem_name);
		
		request.setAttribute("ordered_date", oOrdered_date);
		request.setAttribute("status", oStatus);
		request.setAttribute("nowPage", oPage);
		request.setAttribute("select_count", oSelect_count);
		request.setAttribute("dto", dto);
		request.setAttribute("mainUrl", "member_view/OrderDetailForm");
	}
}
