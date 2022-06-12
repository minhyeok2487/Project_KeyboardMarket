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
		
		dto.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		dto.setUser_id(request.getParameter("user_id"));
		dto.setUser_pw(request.getParameter("user_pw"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddr1(request.getParameter("addr1"));
		dto.setAddr2(request.getParameter("addr2"));
		dto.setTel(request.getParameter("tel"));

		
		int res = new memberDAO().modify(dto);
		
		String msg = "수정실패", goUrl = "ModifyForm";
		
		if(res>0) {
			msg = "수정성공";
			goUrl = "ModifyForm";

		}
		
//		request.setAttribute("msg", msg);
//		request.setAttribute("goUrl", goUrl);
//		request.setAttribute("mainUrl", "alert");
		request.setAttribute("mainUrl", "./main/pages");
	}

}
