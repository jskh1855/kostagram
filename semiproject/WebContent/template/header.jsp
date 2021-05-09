<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
		
<c:choose>
<c:when test="${sessionScope.mvo==null}">
			<section class="ftco-section ftco-bread" style="padding:0;">
				<img src="main/images/logo.png" width="100" height="50">	
				<div class="container">

					<div class="row no-gutters slider-text justify-content-center align-items-center">
<!-- 	          <div class="col-md-8 ftco-animate"> -->
<!-- 	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Collection</span></p> -->
<!-- 	            <h1 class="bread">My Collection</h1> -->
<!-- 	          </div> -->
	        </div>
				</div>
			</section>
</c:when>
<c:otherwise>
			<section class="ftco-section ftco-bread" style="padding:0;">
					<img src="main/images/logo.png" width="100" height="50">	
				<div class="container">
					 <a href="${pageContext.request.contextPath}/LogoutController.do" style= "color: black;">로그아웃</a>
					<div class="row no-gutters slider-text justify-content-center align-items-center">
<!-- 	          <div class="col-md-8 ftco-animate"> -->
<!-- 	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Collection</span></p> -->
<!-- 	            <h1 class="bread">My Collection</h1> -->
<!-- 	          </div> -->
	        </div>
				</div>
			</section>

<%-- <a href="${pageContext.request.contextPath}/index.jsp">홈</a>&nbsp;&nbsp; --%>
<%--  ${sessionScope.mvo.userName}님 &nbsp;&nbsp;  --%>
<%--  <a href="${pageContext.request.contextPath}/WritePostFormController.do">글쓰기</a> --%>
<%--  <a href="${pageContext.request.contextPath}/board/myPage.jsp">마이페이지</a> --%>
<%--  <a href="${pageContext.request.contextPath}/LogoutController.do">로그아웃</a> --%>

</c:otherwise>
</c:choose>

