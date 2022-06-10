package service.cartpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.cart.CartDAO;
import model.cart.CartDTO;


public class DeleteCart implements Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String msg = "상품이 없습니다";
		
		// 장바구니에 데이터가 있는지 확인(있으면 true)
		if(new CartDAO().CheckMemberCart(memberNo)) { //있으면 장바구니 비우기
			new CartDAO().delCart(memberNo);
			msg = "장바구니를 비웠습니다";
		} else { //없으면 넘어감
			
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("mainUrl", "./carts/cartpage");
	}
}
