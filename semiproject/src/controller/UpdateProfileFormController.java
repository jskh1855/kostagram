package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberVO;

public class UpdateProfileFormController implements Controller {
   @Override
   public String execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      HttpSession session=request.getSession(false);
      if(session==null||session.getAttribute("mvo")==null||
            request.getMethod().equals("POST")==false){
         return "redirect:index.jsp";
      }
      
      MemberVO mvo = (MemberVO)session.getAttribute("mvo");
	  String userEmail=mvo.getUserEmail();
		
      MemberVO vo = MemberDAO.getInstance().getProfileByEmail(userEmail);		
		
      request.setAttribute("vo", vo);
      request.setAttribute("url", "../main/profile-update.jsp");
      return "/template/layout.jsp";
   }
}
