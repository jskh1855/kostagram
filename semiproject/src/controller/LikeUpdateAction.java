package controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;


import model.BoardDAO;

public class LikeUpdateAction implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int bno = Integer.parseInt(request.getParameter("board_num"));
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.update_Like(bno);
		int like=bDao.select_Like(bno);
		System.out.println("LikeUpdateAction.java의 like 개수:"+ like);
		JSONObject obj = new JSONObject();
		obj.put("like",like);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
		return null;
	}

}
