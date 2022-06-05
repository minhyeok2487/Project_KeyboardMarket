package service.cartpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.cart.CartDAO;
import model.cart.CartDTO;

public class OrderCart implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CartDAO dao = new CartDAO();
		int memberNo = 1; // 멤버 기본키 로그인시 받아올 예정
		

		ArrayList<CartDTO> cartList = dao.list(memberNo);
		request.setAttribute("cartList", cartList);

	}
}
