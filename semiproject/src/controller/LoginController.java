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
		if (MemberDAO.getInstance().isExist(userEmail) == false) {
			return "redirect:noEmail.jsp";
		}
		else if (MemberDAO.getInstance().isChecked(userEmail) == false) {
			return "redirect:emailFail.jsp";
		}
		
		MemberVO mvo = MemberDAO.getInstance().login(userEmail, userPassword);
		
		if (mvo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", mvo);	
			
			// return "redirect:main/home.jsp";
			
			// (재훈)HomeController 에서도 home.jsp로 response(?)하는데 
			// LoginController 에서도 home.jsp로 response?
			// header footer 분리를 위해서는 url 파라미터를 넘겨줘야할것같습니다. 
			
			return "redirect:index.jsp"; // 수정전 22번 코드 
		} else {			
			return "redirect:register/login-fail.jsp";		
		}
	}	
		
	
}
