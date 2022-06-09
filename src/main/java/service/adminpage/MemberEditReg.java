package service.adminpage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberEditReg implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String msg = null;
		String goUrl = "MemberControl";
		
		memberDTO dto = new memberDTO();
		dto.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		dto.setUser_id(request.getParameter("user_id"));
		//dto.setUser_pw(request.getParameter("user_pw")); 비밀번호 토큰화 작업후 작업하는게좋음
		dto.setName(request.getParameter("name"));
		//dto.setBirthdate(request.getParameter("birthdate")); 변환 귀찮...
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddr1(request.getParameter("addr1"));
		dto.setAddr2(request.getParameter("addr2"));
		dto.setTel(request.getParameter("tel"));
		
		int res = new memberDAO().Adminmodify(dto);
	
		if(res>0) {
			msg="수정성공";
		} else {
			msg = "수정실패";
			goUrl = "MemberEdit?memberNo="+dto.getMemberNo();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "./admins/adminAlert");
	}
}
