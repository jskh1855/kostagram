<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.MemberVO"%>

<%
	//session을 이용하여 userId를 찾아서 DB에 저장된 email을 가져온다. ex) codingspecialist@naver.com

	//해당 이메일로 SHA256한 값과 code 값을 비교한다.
	String code = request.getParameter("code");
	MemberVO mvo = (MemberVO)session.getAttribute("mvo");
	boolean rightCode = 
			SHA256.getEncrypt(mvo.getUserEmail(), "cos").equals(code) ? true : false;
 	PrintWriter script = response.getWriter();

	if(rightCode == true){
		mvo.setUserEmailChecked(1);
		session.setAttribute("mvo", mvo);
		script.println("<script>");
		script.println("alert('이메일 인증에 성공하였습니다.')");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('이메일 인증을 실패하였습니다.')");
		script.println("location.href='error.jsp'");
		script.println("</script>");
	}
%>    