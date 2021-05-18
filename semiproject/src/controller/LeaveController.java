package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberDAO;
import model.MemberVO;

public class LeaveController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession(false);
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		/*
		 * BoardDAO.getInstance().deleteLikeByEmail(mvo.getUserEmail());
		 * BoardDAO.getInstance().deletePostByEmail(mvo.getUserEmail());
		 */
		MemberDAO.getInstance().deleteMemberByEmail(mvo.getUserEmail());
		session.setAttribute("mvo", null);	
		
		request.setAttribute("url", "/register/login.jsp");
		return "/template/layout.jsp";
	}
}
