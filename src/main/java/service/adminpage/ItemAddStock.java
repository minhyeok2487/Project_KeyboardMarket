package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.order.OrderDAO;
import model.order.OrderDTO;

public class ItemAddStock implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		itemDAO dao = new itemDAO();
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		itemDTO getItem = dao.Detail(itemNo);
		
		request.setAttribute("getItem", getItem);
		request.setAttribute("mainUrl", "./admins/itemaddstockpage");
		
	}
}
