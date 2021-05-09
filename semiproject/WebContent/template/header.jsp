<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
		
<a href="${pageContext.request.contextPath}/HomeController.do"><img src ="./pics/sample.jpg" width= "180" align="left"></a>

		
<c:choose>
<c:when test="${sessionScope.mvo==null}">

<!-- kostagram logo -->
</c:when>
<c:otherwise>
<a href="${pageContext.request.contextPath}/index.jsp">홈</a>&nbsp;&nbsp;
 ${sessionScope.mvo.name}님 &nbsp;&nbsp; 
 <a href="${pageContext.request.contextPath}/">글쓰기</a>
 <a href="${pageContext.request.contextPath}/LogoutController.do">로그아웃</a>
</c:otherwise>
</c:choose>
