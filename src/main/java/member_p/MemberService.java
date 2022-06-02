package member_p;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class F_Controller
 */
@WebServlet("/member/*")
public interface MemberService {

	void execute(HttpServletRequest request, HttpServletResponse response);
	
}
