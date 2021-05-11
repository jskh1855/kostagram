package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberVO;

/**
 * Servlet implementation class LikesCountServlet
 */
@WebServlet("/LikesCountServlet")
public class LikesCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikesCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    int count;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession(false);
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String no = request.getParameter("no");
		String email = mvo.getUserEmail();
		String like = request.getParameter("like");
		PrintWriter out = response.getWriter();
		
		System.out.println(email);
		
		if (like.equals("1")) {
			try {
				BoardDAO.getInstance().deleteLike(no, email);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}else {
			try {
				BoardDAO.getInstance().insertLike(no, email);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}

		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
