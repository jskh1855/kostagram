<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.MemberDAO"%>
<%@page import="model.MemberVO"%>
<%@page import="java.util.ArrayList" %>

<%
	//session을 이용하여 userId를 찾아서 DB에 저장된 email을 가져온다. ex) codingspecialist@naver.com

	//해당 이메일로 SHA256한 값과 code 값을 비교한다.
	String code = request.getParameter("code");
	ArrayList<String> list = MemberDAO.getInstance().getAllMember();
	String email = null;
 	boolean rightCode = true;
	for (int i =0;i<list.size();i++){
		if (SHA256.getEncrypt(list.get(i), "cos").equals(code)){
 			email = list.get(i);
		}
	}
	MemberDAO.getInstance().emailChecked(email);

 	PrintWriter script = response.getWriter();

	if(rightCode == true){
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