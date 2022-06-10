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
		

		// 1.최근 일주일 주문량
		ArrayList<OrderDTO> allList = new OrderDAO().allList();
		int total = 0;
		for(OrderDTO price : allList) {
			total += price.getPrice();
		}
	

		// 1.최근 일주일 주문량
		ArrayList<OrderDTO> orderList = new OrderDAO().list();
		ArrayList<OrderDTO> mainList = new ArrayList<OrderDTO>();
		for (int i = 0; i < orderList.size(); i++) {
			boolean res = true;
			for (int j = 0; j < mainList.size(); j++) {
				if (mainList.get(j).getOrdered_num().equals(orderList.get(i).getOrdered_num())) {
					mainList.get(j).setPrice(mainList.get(j).getPrice() + orderList.get(i).getPrice());
					mainList.get(j)
							.setSelect_count(mainList.get(j).getSelect_count() + orderList.get(i).getSelect_count());
					res = false;
					break;
				}
			}
			if (res) {
				mainList.add(orderList.get(i));
			}
		}

		// 2.배송해야 할 것
		ArrayList<OrderDTO> orderinglist = new OrderDAO().orderinglist();
		ArrayList<OrderDTO> mainorderinglist = new ArrayList<OrderDTO>();
		for (int i = 0; i < orderinglist.size(); i++) {
			boolean res = true;
			for (int j = 0; j < mainorderinglist.size(); j++) {
				if (mainorderinglist.get(j).getOrdered_num().equals(orderinglist.get(i).getOrdered_num())) {
					mainorderinglist.get(j)
							.setPrice(mainorderinglist.get(j).getPrice() + orderinglist.get(i).getPrice());
					mainorderinglist.get(j).setSelect_count(
							mainorderinglist.get(j).getSelect_count() + orderinglist.get(i).getSelect_count());
					res = false;
					break;
				}
			}
			if (res) {
				mainorderinglist.add(orderinglist.get(i));
			}
		}
		
		// 3. 환불 리스트
		
		ArrayList<OrderDTO> refund_list = new OrderDAO().refundList();
		ArrayList<OrderDTO> refundAll = new ArrayList<OrderDTO>();
		ArrayList<OrderDTO> refundNO = new ArrayList<OrderDTO>();
		
		for(int i=0;i<refund_list.size();i++) {
			if(!refund_list.get(i).getRefund().equals("취소불가")) {
				refundAll.add(refund_list.get(i));
			}else {
				refundNO.add(refund_list.get(i));
			}
		}
		

		request.setAttribute("total", total);
		request.setAttribute("mainList", mainList);
		request.setAttribute("refund", refundAll);
		request.setAttribute("refundNO", refundNO);
		request.setAttribute("mainorderinglist", mainorderinglist);
		request.setAttribute("mainUrl", "./admins/admainpage");
	}
}