package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.member.memberDTO;

public class MemberLogout implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		memberDTO user = (memberDTO) session.getAttribute("inUser");
		
		System.out.println(user.getName()+"님 로그아웃");
		
		session.removeAttribute("inUser");
		
		request.setAttribute("mainUrl", "LogoutReg");
	}

}
