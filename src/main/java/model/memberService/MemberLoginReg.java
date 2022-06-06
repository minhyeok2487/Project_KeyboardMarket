package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
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
		
		if(dto != null){
			session.setAttribute("inUser", dto);
		}

		request.setAttribute("msg", "로그인 성공");
		request.setAttribute("goUrl", "LoginReg");
		request.setAttribute("mainUrl", "alert");
		
	}
}
