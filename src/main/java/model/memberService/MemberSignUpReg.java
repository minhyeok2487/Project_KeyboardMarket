package model.memberService;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberSignUpReg implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		

		
		memberDTO dto = new memberDTO();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			dto.setUser_id(request.getParameter("user_id"));
			dto.setUser_pw(request.getParameter("user_pw"));
			dto.setName(request.getParameter("name"));
			
			Date date = format.parse(request.getParameter("birthdate"));
			dto.setBirthdate(date);
			
			dto.setGender(request.getParameter("gender"));
			dto.setEmail(request.getParameter("email"));
			dto.setAddr1(request.getParameter("addr1"));
			dto.setAddr2(request.getParameter("addr2"));
			dto.setTel(request.getParameter("tel"));
			
			new memberDAO().signUp(dto);
			
			
			
			HttpSession session = request.getSession();
			memberDTO user = new memberDTO();

			user.setUser_id(request.getParameter("user_id"));
			user.setUser_pw(request.getParameter("user_pw"));

			memberDTO sDto = new memberDAO().memberLogin(user);

			if (sDto != null) {
				session.setAttribute("inUser", sDto);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("mainUrl", "./member_view/SignUpReg");
	}
}
