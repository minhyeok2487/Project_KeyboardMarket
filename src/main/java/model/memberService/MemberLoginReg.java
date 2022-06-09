package model.memberService;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.main.MainDAO;
import model.main.MainDTO;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberLoginReg implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		memberDTO user = new memberDTO();

		user.setUser_id(request.getParameter("member_id"));
		user.setUser_pw(request.getParameter("member_pw"));

		memberDTO dto = new memberDAO().memberLogin(user);

		if (dto != null) {
			session.setAttribute("inUser", dto);
		}

//		request.setAttribute("msg", "로그인 성공");
//		request.setAttribute("goUrl", "template");
//		request.setAttribute("mainUrl", "alert");
//		request.setAttribute("saveUrl", "main/pages");

		//메인 페이지 수정하면서 에러떠서 임시조치
		// 1.추천상품 리스트
		ArrayList<MainDTO> GoodList = new MainDAO().Currentlist("추천상품");
		ArrayList<itemDTO> GList = new ArrayList<itemDTO>();
		for (MainDTO res : GoodList) {
			GList.add(new itemDAO().Detail(res.getItemNo()));
		}
		// 2.신상품 리스트
		ArrayList<MainDTO> NewList = new MainDAO().Currentlist("신상품");
		ArrayList<itemDTO> NList = new ArrayList<itemDTO>();
		for (MainDTO res : NewList) {
			NList.add(new itemDAO().Detail(res.getItemNo()));
		}
		System.out.println(GList);
		request.setAttribute("GList", GList);
		request.setAttribute("NList", NList);
		request.setAttribute("mainUrl", "./main/pages");
	}
}
