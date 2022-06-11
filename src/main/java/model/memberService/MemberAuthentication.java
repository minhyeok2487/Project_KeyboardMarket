package model.memberService;

import java.util.ArrayList;
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
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberAuthentication implements Service {
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession userFrom = request.getSession();
		String from = (String) userFrom.getAttribute("fromURL");

		
        String email = request.getParameter("email");
        boolean flag = true;
        
		ArrayList<memberDTO> memberList = new memberDAO().allList();
		
		for(memberDTO dto : memberList) {
			if(email.equals(dto.getEmail())) {
				flag = false;
				break;
			}
		}
        
        
        if(flag && from.equals("searchPW")) {
	        request.setAttribute("mainUrl", "./member_view/windowcloseLogin");
        }else {
	        //mail server 설정
	        String host = "smtp.naver.com";
	        String user = "503green503@naver.com"; //자신의 네이버 계정
	        String password = "K99136S64JKH";//자신의 네이버 패스워드
	        
	        //메일 받을 주소
	        String to_email = email;
	        System.out.println(email);
	        
	        //SMTP 서버 정보를 설정한다.
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 465);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");
	        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
	        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	 
	        
	        //인증 번호 생성기
	        StringBuffer temp =new StringBuffer();
	        Random rnd = new Random();
	        for(int i=0;i<10;i++)
	        {
	            int rIndex = rnd.nextInt(3);
	            switch (rIndex) {
	            case 0:
	                // a-z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
	                break;
	            case 1:
	                // A-Z
	                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
	                break;
	            case 2:
	                // 0-9
	                temp.append((rnd.nextInt(10)));
	                break;
	            }
	        }
	        String AuthenticationKey = temp.toString();
	        System.out.println(AuthenticationKey);
	        
	        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user,password);
	            }
	        });
	        
	        //email 전송
	        try {
	            MimeMessage msg = new MimeMessage(session);
	            msg.setFrom(new InternetAddress(user, "key_board shop"));
	            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
	            
	            //메일 제목
	            msg.setSubject("안녕하세요 키보드 쇼핑몰 인증 메일입니다.");
	            //메일 내용
	            msg.setText("인증 번호는 : "+temp);
	            
	            Transport.send(msg);
	            
	        }catch (Exception e) {
	            e.printStackTrace();// TODO: handle exception
	        }
	        
	        request.setAttribute("AuthenticationKey", AuthenticationKey);
	        request.setAttribute("email", email);
	        request.setAttribute("mainUrl", "./member_view/AuthenticationReg");
        }
	}
}
