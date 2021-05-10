package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  response.setContentType("text/html"); // 인코딩은 필터로 적용

		  PrintWriter out = response.getWriter(); // 브라우저에 출력하기 위해
		// 인코딩필터 = body에 들어가는 인코딩이라 파일업로드시 인코딩과 개념 다름
		  // 파일인코딩시 encType은 MultipartRequest의 관점 => 파일 제목등 파일과 관련이 있음
		  String encType = "UTF-8"; // cos.jar파일의 객체 생성 시점에 넣어줌
		  int maxFileSize = 5 * 1024 *1024; // 5MB

		  // MulitpartRequest(request, 저장경로[, 최대허용크기, 인코딩캐릭터셋, 동일한 파일명 보호여부]);
		  // 파일명보호: DefaultFileRenamePolicy => name.zip, name1.zip, ...
		  // 업로드에 해당하는 부분
		  MultipartRequest mr = new MultipartRequest(request, request.getSession().getServletContext().getRealPath("pics"), maxFileSize, encType, new DefaultFileRenamePolicy());

		  // 파일 관련 정보 추출
		  File postImage = mr.getFile("postImage"); // upload1.html의 폼태그 값
		  System.out.println(postImage); // 첨부된 파일의 전체 경로 출력

		  // 파라미터값 읽어오기
		  System.out.println(mr.getParameter("content"));

		  out.println("업로드 완료됨");
		  out.println("파일 경로 => " + postImage.toString());
		  out.println("내용 => " + mr.getParameter("content"));

		  }
		}// class

