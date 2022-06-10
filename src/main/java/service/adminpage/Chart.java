package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.order.OrderDAO;
import model.order.OrderDTO;

public class Chart implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "./admins/chartpage");
		
	}
}
