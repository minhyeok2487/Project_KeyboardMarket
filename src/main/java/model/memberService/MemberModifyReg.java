package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberModifyReg implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		memberDTO user = (memberDTO) session.getAttribute("inUser");
		
		memberDAO dao = new memberDAO();
		
		int id = user.getMemberNo();
		
		// close 하면 detail 에서 접속이안된다.
		
		Object data = dao.detail(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "DetailForm");
	}

}