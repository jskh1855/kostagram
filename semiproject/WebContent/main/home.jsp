<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>main feed</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet">


			<section class="ftco-section-3">
				<div class="photography">
					<div class="row">
				
					<!-- 이미지 카드 한 칸 시작-->
					<c:forEach  items="${requestScope.list}" var="pvo" varStatus="status">
					<div class="col-md-4 ftco-animate">
						<a href="${pvo.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(${pvo.postImage});">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
								<h2>글번호 ${pvo.no}</h2><br>
								<span class="tag">
								<c:set var="contains" value="0" />
									<c:forEach var="email" items="${requestScope.list2}">
									  <c:if test="${email eq pvo.no}">
									    <c:set var="contains" value="1" />
									  </c:if>
									</c:forEach>
								좋아요 유무(0 or 1) : 
									${contains}
									<!-- if else로 좋아요 아이콘 넣을 거임 -->
									<c:if test="${contains} eq 1}">
									    <c:set var="contains" value="1" />
									</c:if>
									<!-- 좋아요 아이콘 끝 -->
								 <br>
								좋아요 개수 : ${status.index}<br><br>
								
								</span>
								</div>
							</div>	
						</a>
					</c:forEach>
				</div>
			</div>
					<!--이미지 카드 한 칸 끝 -->
					
					<!-- 이미지 카드 한 칸 시작-->
				<%-- 	<c:forEach var="pvo" items="${requestScope.list}">
					<div class="col-md-4 ftco-animate">
						<!-- 사진 : ${pvo.post_image} -->
						<a href="${pvo.post_image}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_1.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
								<h3>글번호</h3>
								<span class="tag">
								<c:set var="contains" value="0" />
									<c:forEach var="email" items="${requestScope.list2}">
									  <c:if test="${email eq pvo.no}">
									    <c:set var="contains" value="1" />
									  </c:if>
									</c:forEach>
								좋아요 유무(0 or 1) : 
									${contains}
								 <br>
								</c:forEach>
								</span>
								</div>
						</a>
					</div> --%>
						<!-- <div class="col-md-4 ftco-animate">
							<a href="main/images/image_1.jpg" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(main/images/image_1.jpg);">
								<div class="overlay"></div>
								<div class="text ml-4 mb-4">
									<h3>Photo 01</h3>
									<span class="tag">Model</span>
								</div>
							</a>
						</div> -->
					<!--이미지 카드 한 칸 끝 -->
			</section>
	

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
