package service.cartpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.cart.CartDAO;
import model.cart.CartDTO;


public class RemoveItem implements Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		String msg = "상품이 없습니다";
		
		// 장바구니에 데이터가 있는지 확인(있으면 true)
		if(new CartDAO().CheckMemberCart(memberNo)) { //있으면 장바구니 비우기
			new CartDAO().removeitem(memberNo,itemNo);
		} else { //없으면 넘어감
			
		}
		
		request.setAttribute("itemNo", itemNo);
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("mainUrl", "./carts/cartpage");
	}
}
