package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberDAO;
import model.MemberVO;
import model.PostVO;

public class ProfileDetailController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:index.jsp";
		}
		
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String user_email=mvo.getUserEmail();
		
		MemberVO vo = MemberDAO.getInstance().getProfileTotalList(user_email);		
		request.setAttribute("vo", vo);
		ArrayList<PostVO> list = BoardDAO.getInstance().getPostingListByUser(user_email);		
		request.setAttribute("list", list);
		request.setAttribute("url", "/main/profile.jsp");
		return "/template/layout.jsp";
	}
}







