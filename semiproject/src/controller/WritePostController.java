package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WritePostController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String post_image = request.getParameter("post_image");
		String content = request.getParameter("content");
		System.out.println(post_image + content);
		
		
		return "index.jsp";
	}

}
