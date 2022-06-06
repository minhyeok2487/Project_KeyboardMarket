package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberModifyForm implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		memberDTO dto = new memberDTO();
<<<<<<< Updated upstream
		
=======
>>>>>>> Stashed changes
		dto.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		dto.setUser_id(request.getParameter("user_id"));
		dto.setUser_pw(request.getParameter("user_pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
<<<<<<< Updated upstream
		dto.setAddr1(request.getParameter("addr1"));
		dto.setAddr2(request.getParameter("addr2"));
		dto.setTel(request.getParameter("tel"));
=======
		dto.setUser_pw(request.getParameter("addr1"));
		dto.setUser_pw(request.getParameter("addr2"));
		dto.setUser_pw(request.getParameter("tel"));
>>>>>>> Stashed changes
		
		int res = new memberDAO().modify(dto);
		
		String msg = "수정실패", goUrl = "ModifyForm";
		
		if(res>0) {
			msg = "수정성공";
<<<<<<< Updated upstream
			goUrl = "ModifyForm";
=======
			goUrl = "Detail";
>>>>>>> Stashed changes
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}

}
