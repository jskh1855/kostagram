package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		//DB 저장 했다고 가정 (DB에는 emailAuth 필드가 있어야 하고 최초에는 0이 저장되어 있음) 1 인증 0 미인증
		try {
			if (MemberDAO.getInstance().isExist(email) == true) {
				response.sendRedirect("/semiproject/duplicateEmail.jsp");		
			}
			else {
				
				try {
					MemberDAO.getInstance().register(email,password,name);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			
				//DB에 저장했으니 google email 인증 페이지로 이동
				response.sendRedirect("/semiproject/register/gmailSendAction.jsp?email="+email);
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
