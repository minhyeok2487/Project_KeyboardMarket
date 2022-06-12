package model.memberService;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberAuthenticationReg implements Service {
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String from = (String) session.getAttribute("fromURL");
		
        String AuthenticationKey = request.getParameter("AuthenticationKey");
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        String email = request.getParameter("email");
        
        
        if(from.equals("signUp")) {
	        if(!AuthenticationKey.equals(AuthenticationUser)){
	        	
	    			request.setAttribute("msg", "인증번호가 올바르지 않습니다");
	    			request.setAttribute("goUrl", "./LoginForm");
	    			request.setAttribute("mainUrl", "./member_view/alert");
	        		
	        }else if(AuthenticationKey.equals(AuthenticationUser)){
	        	
	        		session.setAttribute("email", email);
	        		request.setAttribute("mainUrl", "./member_view/SignUpForm");
	        }
	        
	        
        }else if(from.equals("searchPW")){
        		if(!AuthenticationKey.equals(AuthenticationUser)){
        			
	    			request.setAttribute("msg", "인증번호가 올바르지 않습니다");
	    			request.setAttribute("goUrl", "./LoginForm");
	    			request.setAttribute("mainUrl", "./member_view/alert");
	        		
	        }else if(AuthenticationKey.equals(AuthenticationUser)){
	        	
	        		session.setAttribute("email", email);
	        		request.setAttribute("mainUrl", "./member_view/NewPW");
	        		
	        }
        }else if(from.equals("searchID")){
	    		if(!AuthenticationKey.equals(AuthenticationUser)){
	    			
	    			request.setAttribute("msg", "인증번호가 올바르지 않습니다");
	    			request.setAttribute("goUrl", "./LoginForm");
	    			request.setAttribute("mainUrl", "./member_view/alert");
	        		
	        }else if(AuthenticationKey.equals(AuthenticationUser)){
	        	
		    		String uID = "";
		    		
		    		ArrayList<memberDTO> memberList = new memberDAO().allList();
		    		
		    		for(memberDTO dto : memberList) {
		    			if(email.equals(dto.getEmail())) {
		    				uID = dto.getUser_id();
		    				break;
		    			}
		    		}
		    		request.setAttribute("userID", uID);
	        		session.setAttribute("email", email);
	        		request.setAttribute("mainUrl", "./member_view/SearchIDReg");
	        		
	        }
        }
	}
}
