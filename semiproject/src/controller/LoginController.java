package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class LoginController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");
		MemberVO mvo = MemberDAO.getInstance().login(userEmail, userPassword);
		if (mvo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", mvo);	
			
			return "redirect:main/home.jsp";
		} else {			
			return "redirect:register/login-fail.jsp";		
		}
	}	
		
	
}
