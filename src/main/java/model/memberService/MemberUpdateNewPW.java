package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.member.memberDAO;

public class MemberUpdateNewPW implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userID");
		String userPw = request.getParameter("user_pw");
		
		System.out.println(userId + "  : "+ userPw);
		
		new memberDAO().updatePW(userId, userPw);
		
		request.setAttribute("mainUrl", "member_view/windowcloseLogin");
	}

}
