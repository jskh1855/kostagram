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
    </head>
			<section class="ftco-section-3">
				<div class="photography">
					<div class="row">
					탑 3 
					<c:forEach  items="${requestScope.list4}" var="pvoTop3" varStatus="status">
					사진 : <img src="images/contentImage/${pvoTop3.postImage}" alt="My Image" width="100" height="200"> ${pvoTop3.postImage} <br>
					내용 : ${pvoTop3.content}<br>
					작성자 : ${pvoTop3.mvo.userName}<br>
					작성일 : ${pvoTop3.regdate} <br>
					로그인유저의 <br>
					좋아요 유무(0 or 1) : <br>
					좋아요 개수 : <br>
					</c:forEach>
					<br>
					<hr>
					<br>
					<!-- 이미지 카드 한 칸 시작-->
					<c:forEach  items="${requestScope.list}" var="pvo" varStatus="status">
					<div class="col-md-4 ftco-animate">
						<a href="images/contentImage/${pvo.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(images/contentImage/${pvo.postImage});">
								<div class="overlay"></div>
								</a>
								<div class="text ml-4 mb-4" style="display: inline-flex;">
								<h3>글번호 ${pvo.no}</h3>
									<span class="tag">
									<c:set var="contains" value="0" />
										<c:forEach var="email" items="${requestScope.list2}">
										  <c:if test="${email eq pvo.no}">
										    <c:set var="contains" value="1" />
										  </c:if>
										</c:forEach>
										<!-- 좋아요 아이콘이랑 개수 float: right 하고픔 -->
										<div id="like-display">
											좋아요 유무: ${contains}
											<!-- if else로 좋아요 아이콘 넣을 거임 -->
										    <%-- <c:set var="contains" value="1" /> --%>
											<c:choose>
											    <c:when test="${contains eq 1}">
											        좋아요 빨간 버튼
											    </c:when>
											    <c:otherwise>
											        좋아요 하얀 버튼
											    </c:otherwise>
											</c:choose>
											<!-- 좋아요 아이콘 끝 -->
											좋아요 개수 : ${status.index}<br>
											
										</div>
									</span>
								</div>
							</div>	
						<!-- 사진 안에 글번호랑 좋아요 표시하려면 여기서 a태그 닫기 </a> -->
					</c:forEach>
				</div>
			</div>			
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
