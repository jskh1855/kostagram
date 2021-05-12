<%@ page language="java"  isELIgnored="false" contentType="text/html; charset=UTF-8"
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
    
    <!-- Magnific Popup core CSS file -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- jQuery 1.7.2+ or Zepto.js 1.0+ -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <!-- Magnific Popup core JS file -->
    <script src="js/jquery.magnific-popup.js"></script>

    
    </head>
    
			<section class="ftco-section-3">
				<div class="photography">
				
				<div style="background-color: lightgray; margin-bottom: 1rem;">
					<div class="row justify-content-center mb-2 pb-3" >
					<h2 class="mb-4"><strong>HOT 게시물</strong></h2>
					</div>
					
					<div class="row">
					<c:forEach  items="${requestScope.list4}" var="pvoTop3" varStatus="status2">
					<%-- ${pvoTop3 } --%>
					<div class="col-md-4 ftco-animate">
					<a href="images/contentImage/${pvoTop3.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(images/contentImage/${pvoTop3.postImage});">
								<div class="overlay">
								</div>
								</a>
								<div class="text ml-4 mb-4" style="display: inline-flex;">
					
								<a href="ProfileDetailController.do?userEmail=${pvoTop3.mvo.userEmail}"> <img alt="이미지안뜸"
							src="images/profileImage/${pvoTop3.mvo.profileImage}" style="width: 30px; height: 30px;"> ${pvoTop3.mvo.userName}<br></a>
							
					<%-- 작성일 : ${pvoTop3.regdate} <br> --%>
					<!-- 이하 좋아요 개수 표시 코드 수정필요 -->
					<c:set var="contains2" value="0" />
										<c:forEach var="email2" items="${requestScope.list3}">
										  <c:if test="${email2 eq pvoTop3.no}">
										    <c:set var="contains2" value="1" />
										  </c:if>
										</c:forEach>
					<div id="like-display" style="margin-left: 3rem;">
					
											<%-- <c:choose>
											    <c:when test="${contains2 eq 1}">
														<img src="images/contentImage/like_up.png" height="20" width="20">
											    </c:when>
											    <c:otherwise>
														<img src="images/contentImage/dislike_down.png" height="20" width="20">
											    </c:otherwise>
											</c:choose> --%>
											<img src="images/contentImage/like_up.png" height="20" width="20">
											${status2.index}
										</div>
					<!-- end like-display -->
					</div>
					</div>
					</c:forEach>
					<br>
					<br>
					</div>
					</div>
					<!-- 좋아요 탑3 끝 -->
					<div class="row">
					
					<!-- 이미지 카드 한 칸 시작-->
						<c:forEach  items="${requestScope.list}" var="pvo" varStatus="status">
					<div class="col-md-4 ftco-animate">
						<a href="images/contentImage/${pvo.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" title="${pvo.mvo.userName}"  content="${pvo.content }" style="background-image: url(images/contentImage/${pvo.postImage});">
								<div class="overlay">
								</div>
								</a>
								<div class="text ml-4 mb-4" style="display: inline-flex;">
								
								<a href="ProfileDetailController.do?userEmail=${pvo.mvo.userEmail}"> <img alt="이미지안뜸"
							src="images/profileImage/${pvo.mvo.profileImage}"
							style="width: 30px; height: 30px;"> ${pvo.mvo.userName}<br></a>
							
								<%-- <a href="ProfileDetailController.do">
								<img alt="프로필사진" src="images/profileImage/profile_default.jpg" style="width:3rem; height:3rem;">
								${pvo.mvo.userName}</a> --%>
<%-- 								<h3>글번호 ${pvo.no}</h3> --%>
									<!-- <span class="tag"> -->
									<div>
									<c:set var="contains" value="0" />
										<c:forEach var="email" items="${requestScope.list2}">
										  <c:if test="${email eq pvo.no}">
										    <c:set var="contains" value="1" />
										  </c:if>
										</c:forEach>
										<!-- 좋아요 아이콘이랑 개수 float: right 하고픔 -->
										<div id="like-display" style="margin-left: 3rem;">
											<c:choose>
											    <c:when test="${contains eq 1}">
														<img src="images/contentImage/like_up.png" height="20" width="20">
											    </c:when>
											    <c:otherwise>
														<img src="images/contentImage/like_down.png" height="20" width="20">
											    </c:otherwise>
											</c:choose>
											${status.index}
											
										</div>
										</div>
									<!-- </span> -->
								</div>
							</div>	
						<!-- 사진 안에 글번호랑 좋아요 표시하려면 여기서 a태그 닫기 </a> -->
					</c:forEach>
				</div>
			</div>			
		</section>
	
<script type="text/javascript">
$(document).ready(function() {

	$('.simple-ajax-popup-align-top').magnificPopup({
		type: 'ajax',
		alignTop: true,
		overflowY: 'scroll' // as we know that popup content is tall we set scroll overflow by default to avoid jump
	});

	$('.simple-ajax-popup').magnificPopup({
		type: 'ajax'
	});
	$('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title') + item.el.attr('content') +  '<small>by Marsel Van Oosten</small>';
			}
		}
	});
});

</script>
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
