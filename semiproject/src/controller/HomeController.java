package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class HomeController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			request.setAttribute("url", "/register/login.jsp");
			return "/template/layout.jsp";
		}
		else {
			request.setAttribute("url", "/main/home.jsp");
			return "/template/layout.jsp";
		}

	}

}
