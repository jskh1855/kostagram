<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>홈테스트~</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">

</head>
<body>
			<section class="ftco-section-3">
				<div class="photography">
					<div class="row">    
			<%--출력을 뭐해야하나 포스트 no, 이미지, content, 좋아요 유무, 좋아요 갯수,  --%>
					<c:forEach var="pvo" items="${requestScope.list}">
					<div class="col-md-4 ftco-animate">
						사진 : ${pvo.postImage}
						<a href="main/images/image_1.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_1.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
								<h3>글번호 ${pvo.no}</h3>
								<span class="tag">
								<!-- 로그인유저의  <br> -->
								<c:set var="contains" value="0" />
									<c:forEach var="email" items="${requestScope.list2}">
									  <c:if test="${email eq pvo.no}">
									    <c:set var="contains" value="1" />
									  </c:if>
									</c:forEach>
								좋아요 유무(0 or 1) : 
									${ contains}
								 <br>
								좋아요 개수 : 아직안함<br>
								</c:forEach>
								</span>
					<%-- 내용 : ${pvo.content}<br>
					작성자 : ${pvo.mvo.userName}<br>
					작성일 : ${pvo.regdate} <br> --%>
								</div>
						</a>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_2.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_2.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 02</h3>
									<span class="tag">Nature</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_3.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_3.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 03</h3>
									<span class="tag">Fashion</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_4.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_4.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 04</h3>
									<span class="tag">Travel</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_5.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_5.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 05</h3>
									<span class="tag">Travel</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_6.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_6.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 06</h3>
									<span class="tag">Travel</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_7.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_7.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 07</h3>
									<span class="tag">Fashion, Model</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_8.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_8.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 08</h3>
									<span class="tag">Nature</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_9.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_9.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 09</h3>
									<span class="tag">Technology</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_10.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_10.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 10</h3>
									<span class="tag">Model</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_11.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_11.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 11</h3>
									<span class="tag">Fashion</span>
								</div>
							</a>
						</div>
						<div class="col-md-4 ftco-animate">
							<a href="main/images/image_12.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_12.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 12</h3>
									<span class="tag">Photography</span>
								</div>
							</a>
						</div>
						</div>
					</div>
</section>

<c:forEach  items="${requestScope.list}" var="pvo"  varStatus="status">
번호 : ${pvo.no} <br>
사진 : ${pvo.postImage}<br>
내용 : ${pvo.content}<br>
작성자 : ${pvo.mvo.userName}<br>
작성일 : ${pvo.regdate} <br>
로그인유저의  <br>
<c:set var="contains" value="0" />
	<c:forEach var="email" items="${requestScope.list2}">
	  <c:if test="${email eq pvo.no}">
	    <c:set var="contains" value="1" />
	  </c:if>
</c:forEach>
좋아요 유무(0 or 1) : ${ contains}<br>
좋아요 개수 :${status.index}<br>
</c:forEach>
</body>