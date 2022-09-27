package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontControllerServlet
 */
@WebServlet("*.do")
public class FrontControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;    
    public FrontControllerServlet() {
        super();       
    }
    /*
     *  step0 예외 발생시 기록을 남기고 error.jsp로 redirect 처리한다 
     *  step1 클라이언트의 요청 uri 로부터 컨트롤러명을 추출 
     *  step2 HandlerMapping 을 이용해 해당 컨트롤러 객체를 반환 
     *  step3 반환받은 컨트롤러 객체를 실행 후 리턴값(view정보)을 반환 
     *  step4 응답할 View를 forward 또는 rediect 방식으로 이동해서 response 하게 한다 
     */
    public void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    	String uri=request.getRequestURI();
    	String contextPath=request.getContextPath();
    	String command=uri.substring(contextPath.length()+1,uri.length()-".do".length());
    	//System.out.println(command);// MockController
    	Controller controller=HandlerMapping.getInstance().create(command);
    	String view=controller.execute(request, response);
    	if(view.startsWith("redirect:")) {
    		response.sendRedirect(view.substring("redirect:".length()));
    	}else {
    		request.getRequestDispatcher(view).forward(request, response);
    	}
    	
    	}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		handleRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		handleRequest(request, response);
	}
}

