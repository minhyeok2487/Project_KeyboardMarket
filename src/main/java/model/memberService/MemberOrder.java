package model.memberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.member.memberDAO;
import model.member.memberDTO;

public class MemberOrder implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		memberDTO member = (memberDTO)session.getAttribute("inUser");
		
		int memberNo = member.getMemberNo();
		
		int page;
		if(request.getAttribute("nowPage") != null) {
			page = (int)request.getAttribute("nowPage");
		}else {
			page = 1;
		}
		
		int limit = 10; // 한 페이지당 게시물 수
		int pageLimit = 10; // 페이지 번호 갯수
		
		memberDAO dao = new memberDAO();
		
		int total = dao.totalCnt(memberNo);
		
		int pageTotal = total/limit;
		
		// 나머지가 있다면 +1
		if(total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1)*limit;
		int pageStart = (page-1)/pageLimit*pageLimit+1;
		int pageEnd = pageStart+pageLimit-1;
		
		if(pageEnd>pageTotal) {
			pageEnd = pageTotal;
		}
		
		Object data = new memberDAO().orderList(start,limit,memberNo);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "member_view/OrderForm");

		request.setAttribute("total", total);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}

}