package model.memberService;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;

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
	        	
	        		request.setAttribute("mainUrl", "./member_view/LoginForm");
	        		
	        }else if(AuthenticationKey.equals(AuthenticationUser)){
	        	
	        		session.setAttribute("email", email);
	        		request.setAttribute("mainUrl", "./member_view/SignUpForm");
	        }
	        
	        
        }else if(from.equals("searchPW")){
        		if(!AuthenticationKey.equals(AuthenticationUser)){
        			request.setAttribute("mainUrl", "./member_view/LoginForm");
	        		
	        }else if(AuthenticationKey.equals(AuthenticationUser)){
	        	
	        		session.setAttribute("email", email);
	        		request.setAttribute("mainUrl", "./member_view/NewPW");
	        		
	        }
        }
	}
}
