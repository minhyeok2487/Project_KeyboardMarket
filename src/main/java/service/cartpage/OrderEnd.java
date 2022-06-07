package service.cartpage;

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

public class OrderEnd implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		CartDAO dao = new CartDAO();
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String ordered_num = request.getParameter("ordered_num");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		ArrayList<CartDTO> cartList = dao.list(memberNo);
		memberDTO member = new memberDAO().detail(memberNo);
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy년MM월dd일 HH시mm분ss초");
		String merchant = simpleDateFormat.format(date);
		
		OrderDAO orderdao = new OrderDAO();
		for(int i=0; i<cartList.size();i++) {
			orderdao.addOrder(ordered_num,merchant,member,addr1,addr2,cartList.get(i));
		}
		dao.delCart(memberNo); //장바구니 비우기
		
		request.setAttribute("cartList", cartList);
		request.setAttribute("mainUrl", "./carts/orderendpage");
	}
}
