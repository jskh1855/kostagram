package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

public class RecUpdate implements Controller{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// no와 id값을 map에 저장
		
		String no = request.getParameter("no");
		String email = request.getParameter("email");
		
		BoardDAO manager = BoardDAO.getInstance();
		// 동일 게시글에 대한 이전 추천 여부 검색
		int result = manager.likeCheck(no, email);
		
		if(result == 0){ // 추천하지 않았다면 추천 추가
			manager.insertLike(no, email);
		}else{ // 추천을 하였다면 추천 삭제
			manager.deleteLike(no, email);
		}
		return null;
	}

}
