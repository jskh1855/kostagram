<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<section class="ftco-section ftco-bread" style="padding: 0;">
	<div class="container">
		<!-- 		<div class="row no-gutters slider-text justify-content-center align-items-center"> -->
		<div class="row justify-content-center mb-2 pb-3">
			<a href="${pageContext.request.contextPath}/index.jsp"><img
				src="pics/logo.png" width="250rem" height="100rem"></a>
		</div>
		<c:choose>
			<c:when test="${sessionScope.mvo==null}">
			</c:when>
			<c:otherwise>
				<div style="float:right; position: absolute;
        right: 2rem;
        top: 3.5rem;">
						<div class="kostagram2" style="align-items: center;">
							<%-- 							<div><a href="${pageContext.request.contextPath}/index.jsp">홈</a>&nbsp;&nbsp;</div> --%>
							<%-- 							 <div>${sessionScope.mvo.userName}님 &nbsp;&nbsp;</div> --%>
							
							
							<a
								href="${pageContext.request.contextPath}/ProfileDetailController.do?userEmail=${sessionScope.mvo.userEmail}">
								<img alt="이미지안뜸" class="image--cover"
								src="images/profileImage/${sessionScope.mvo.profileImage}"
								style="width: 50px; height: 50px;">
							</a>&nbsp;&nbsp;
							<a
								href="${pageContext.request.contextPath}/ProfileDetailController.do?userEmail=${sessionScope.mvo.userEmail}"
								style="color: black;"><h1 style="margin-bottom: 0;"><strong>${sessionScope.mvo.userName}님</strong></h1> </a>&nbsp;&nbsp;
							
							<div>
								<a
									href="${pageContext.request.contextPath}/WritePostFormController.do"><img
									src="pics/post.png" width="100rem" height="50rem" style="margin-bottom: 0.5rem;"></a>
							</div>
							&nbsp;&nbsp;
							<div>
								<a href="${pageContext.request.contextPath}/LogoutController.do"><img
									src="pics/logout.png" width="100rem" height="50rem"></a>
							</div>
						</div>
					
	</div>
				</c:otherwise>
			</c:choose>
		</div>
	<!-- 	</div> -->
</section>


<%-- 					<a href="${pageContext.request.contextPath}/index.jsp" style= "color: black;">홈</a>&nbsp;&nbsp; --%>
<%-- 					<a href="${pageContext.request.contextPath}/ProfileDetailController.do" style= "color: black;"> ${sessionScope.mvo.userName}님</a>&nbsp;&nbsp; --%>
<%-- 					 <a href="${pageContext.request.contextPath}/WritePostFormController.do" style= "color: black;">글쓰기</a>&nbsp;&nbsp; --%>
<%-- 					 <a href="${pageContext.request.contextPath}/LogoutController.do" style= "color: black;">로그아웃</a>&nbsp;&nbsp; --%>


<%-- 이하 기존코드 --%>
<%-- 		
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

<a href="${pageContext.request.contextPath}/index.jsp">홈</a>&nbsp;&nbsp;
 ${sessionScope.mvo.userName}님 &nbsp;&nbsp; 
 <a href="${pageContext.request.contextPath}/WritePostFormController.do">글쓰기</a>
 <a href="${pageContext.request.contextPath}/board/myPage.jsp">마이페이지</a>
 <a href="${pageContext.request.contextPath}/LogoutController.do">로그아웃</a>

</c:otherwise>
</c:choose>

 --%>
