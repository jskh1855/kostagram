package controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberVO;
import model.PostVO;


public class HomeController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			request.setAttribute("url", "/register/login.jsp");
			return "/template/layout.jsp";
		}
		else {
			MemberVO mvo = (MemberVO)session.getAttribute("mvo");
			ArrayList<PostVO> list = BoardDAO.getInstance().getPostingTotalList();
			ArrayList<String> list2 = BoardDAO.getInstance().listLikes(mvo.getUserEmail());
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			//request.setAttribute("url", "/main/home.jsp"); 
			request.setAttribute("url", "/main/homeTest.jsp"); 
			
			return "/template/layout.jsp";
		}

	}

}
