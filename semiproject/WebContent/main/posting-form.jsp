<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--(재훈)
	포스팅화면. 
	
	사진, 내용
	
 --%>
 
 <%-- <form method="post" action="${pageContext.request.contextPath}/WritePostController.do" >
  --%>
  
  <form action="UploadServlet" method="post" enctype="multipart/form-data">
        file: <input type="file" name="postImage"><br>
        content: <input type="text" name="content"><br>
        <input type="submit" value="포스팅 업로드!">
 </form>
 
test test