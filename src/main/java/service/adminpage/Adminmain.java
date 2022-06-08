package service.adminpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.cart.CartDAO;
import model.cart.CartDTO;
import model.member.memberDAO;
import model.member.memberDTO;
import model.order.OrderDAO;
import model.order.OrderDTO;

public class Adminmain implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		OrderDAO dao = new OrderDAO();
		ArrayList<OrderDTO> orderList = dao.list();
		
		ArrayList<OrderDTO> mainList = new ArrayList<OrderDTO>();
		for(int i =0; i< orderList.size(); i++) {
			for(int j=0; j<mainList.size(); j++) {
				if(orderList.get(i).getOrdered_num().equals(mainList.get(j).getOrdered_num())) {
					mainList.get(j).setPrice(mainList.get(j).getPrice()+orderList.get(i).getPrice());
					mainList.get(j).setSelect_count(mainList.get(j).getSelect_count()+orderList.get(i).getSelect_count());
				} else {
					mainList.add(orderList.get(i));
				}
			}
		}
	
		request.setAttribute("orderList", orderList);
		request.setAttribute("mainList", mainList);
		request.setAttribute("mainUrl", "./admins/admainpage");
	}
}