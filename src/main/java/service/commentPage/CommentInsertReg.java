package service.commentPage;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Service;
import model.comment.CommentDAO;
import model.comment.CommentDTO;
import model.member.memberDTO;

public class CommentInsertReg implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String msg = null;
		HttpSession session = request.getSession();
		memberDTO mDTO = (memberDTO) session.getAttribute("inUser");
		int memberNum = mDTO.getMemberNo();
		String getName = mDTO.getName();
		String getId = mDTO.getUser_id();

			CommentDTO dto = new CommentDTO();
			dto.setSubject(request.getParameter("subject"));
			dto.setUser_id(getId);
			dto.setPname(getName);
			dto.setComment(request.getParameter("comment"));
			dto.setMemberNo(memberNum);
			msg = "댓글을 작성했어요 :)";
			new CommentDAO().insert(dto);
			System.out.println(dto);


		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "./comments/commentAlert");
		request.setAttribute("goUrl", "CommentList");
	}
}
