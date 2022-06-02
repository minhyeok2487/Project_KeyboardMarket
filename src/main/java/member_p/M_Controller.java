package member_p;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class F_Controller
 */
@WebServlet("/member/*")
public class M_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ArrayList<String> nonClass;
	
	public M_Controller() {
		super();
        nonClass = new ArrayList<String>();
        System.out.println("들어옴");
	}
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		System.out.println(request.getRequestURI());
		System.out.println(request.getContextPath());
		
		String serviceStr = request.getRequestURI().substring(
				(request.getContextPath()+"/member/").length()
				);
		
		if(nonClass.contains(serviceStr)) {
			request.setAttribute("mainUrl", serviceStr);
		}else {
			try {
				MemberService service = (MemberService) Class.forName("member_p.service_p.Member"+serviceStr).newInstance();
				service.execute(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
	
			//System.out.println("doGet() 들어옴");
			// 포워딩의 액션태그 기능을 쓰기위한 사전작업 앞에 / 안붙이면 무한루프돌음
			RequestDispatcher dispatcher = request.getRequestDispatcher("/member_view/template.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
}
