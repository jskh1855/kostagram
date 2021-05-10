package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberVO;
import model.PostVO;

public class RegisterController implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setAttribute("url", "/register/register.jsp"); 
			return "/template/layout.jsp";
	}

}
