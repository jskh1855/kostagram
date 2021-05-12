package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BoardDAO;
import model.MemberVO;

public class DeletePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession(false);
//		if(session==null||session.getAttribute("mvo")==null||
//				request.getMethod().equals("POST")==false){
//			return "redirect:index.jsp";
//		}
		MemberVO mvo = (MemberVO)session.getAttribute("mvo");
		String no=request.getParameter("no");
		System.out.println("number:"+no);
		BoardDAO.getInstance().deleteAllLikes(no);
		BoardDAO.getInstance().deletePosting(no);
		// 게시물 목록을 보여주기 위해
		// 리다이렉트 방식으로 이동시킨다. 
		return "redirect:ProfileDetailController.do?userEmail="+mvo.getUserEmail();
	}
 
}






