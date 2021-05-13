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
    int likeCount;
//    String likeBoolean;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession(false);
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String no = request.getParameter("no");
		String email = mvo.getUserEmail();
		String like = request.getParameter("like");
		PrintWriter out = response.getWriter();
		
		if (like.equals("0")) {
			try {
				BoardDAO.getInstance().deleteLike(no, email);
				System.out.println("좋아요 취소  ");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}else {
			try {
				BoardDAO.getInstance().insertLike(no, email);
				System.out.println("좋아요   ");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		
		
		try {
			likeCount = BoardDAO.getInstance().countLikes(no);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		out.println(likeCount);
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