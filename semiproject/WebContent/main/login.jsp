<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="post" action="${pageContext.request.contextPath}/LoginController.do">
    <input type="text" name="id"   placeholder="아이디" size="24"> 
   <input type="password" name="password"  placeholder="비밀번호" size="24">
    <input type="submit" value="로그인">
</form>
<form method="post" action="main/register.jsp">
    <input type="submit" value="회원가입">
</form>