package model.memberService;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberSearchIDReg implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String uEmail = request.getParameter("email");
		String uID = "일치하는 회원이 없습니다";
		
		
		ArrayList<memberDTO> memberList = new memberDAO().allList();
		
		request.setAttribute("userID", uID);
		
		for(memberDTO dto : memberList) {
			if(uEmail.equals(dto.getEmail())) {
				uID = dto.getUser_id();
				request.setAttribute("userID", uID);
				break;
			}
		}
		
		request.setAttribute("mainUrl", "./member_view/SearchIDReg");
	}

}
