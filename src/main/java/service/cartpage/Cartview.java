package service.cartpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.cart.CartDAO;
import model.cart.CartDTO;

public class Cartview implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CartDAO dao = new CartDAO();
		String reg = request.getParameter("reg");
		int memberNo = 1; // 멤버 기본키 로그인시 받아올 예정
		
		// 장바구니 추가일때
		if (reg.equals("addCart")) {
			int itemNo = Integer.parseInt(request.getParameter("itemNo"));
			// 이미 장바구니에 있는지 확인(없으면 true)
			if (dao.CheckCart(itemNo, memberNo)) { // 없으면 추가
				CartDTO dto = dao.ItemToCartDTO(itemNo);
				dto.setSelected_count(Integer.parseInt(request.getParameter("count")));
				dto.setMemberNo(memberNo);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String strNowDate = simpleDateFormat.format(new Date());
				dto.setReg_date(strNowDate);
				dao.insert(dto); // DB에 추가
			} else { // 이미 있으면 안넣고 있는거 출력

			}
		}

		//장바구니 비우기일때
		if (reg.equals("delCart")) {

		}

		ArrayList<CartDTO> cartList = dao.list(memberNo);
		// System.out.println(cartList.size());
		request.setAttribute("cartList", cartList);

	}
}
