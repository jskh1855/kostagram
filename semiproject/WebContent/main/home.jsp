<%@ page language="java"  isELIgnored="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <!DOCTYPE html> -->
<!-- <html lang="en"> -->
<!-- <head> -->
<!--     <meta charset="utf-8"> -->
<!--     <title>main feed</title> -->
<!--     <meta charset="utf-8"> -->
<!--     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    
<!--     <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet"> -->
<!--     <link href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff" rel="stylesheet"> -->
    
<!--     Magnific Popup core CSS file -->
<!--     <link rel="stylesheet" href="css/magnific-popup.css"> -->
<!--     jQuery 1.7.2+ or Zepto.js 1.0+ -->
<!--     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
<!--     Magnific Popup core JS file -->
<!--     <script src="js/jquery.magnific-popup.js"></script> -->

    
<!--     </head> -->
    <style>
    like-button {
      -webkit-text-stroke: 1px;
      animation: .5s linear burst; 
    }
    @keyframes burst{
    0%,10%{
        transform: scale(1);
        opacity: .5;
        color:lavender;
    }
    45%{
        transform: scale(.2) rotate(30deg);
        opacity: .75;
    }
    50%{
        transform: scale(2) rotate(-37.5deg);
        opacity: 1;
        color: red;
        text-shadow: 2px 2px 6px rgba(235, 9, 9, 0.5);
    }
    90%,95%{
        transform: scale(1) rotate(10deg);
        text-shadow: none;
    }
    100% {
        transform: rotate(-2.5deg);
    }

  }
 
}
    </style>
			<section class="ftco-section-3">
				<div class="photography">
				
				<div class="top3" style="background-color: rgb(204 183 143 / 20%); padding: 0 1rem 2rem 2rem; margin-right: -1rem; margin-left: -1rem;">
					<div class="row justify-content-center mb-2 pb-3">
					<h2 class="text ml-4 mb-4" style="text-align: center; margin: 2rem -2rem 0 0 !important;"><strong>HOT 게시물</strong></h2>
					</div>
					
					<div class="row">
					<c:forEach  items="${requestScope.list4}" var="pvoTop3" varStatus="status2">
					<%-- ${pvoTop3 } --%>
					<div class="col-md-4 ftco-animate" id="top3-post" style="box-shadow: 0 2px 4px 0 rgb(216 216 216 / 20%), 0 16px 68px 0 rgb(216 216 216 / 40%) background-color: white !important;">
					<a href="images/contentImage/${pvoTop3.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(images/contentImage/${pvoTop3.postImage});">
								<div class="overlay">
								</div>
								</a>
								<div class="text ml-4 mb-4" style="display: inline-flex; align-items: center;  margin-top: 0 !important;  margin-bottom: 0 !important;">
					
								<a href="ProfileDetailController.do?userEmail=${pvoTop3.mvo.userEmail}"> <img class="image--cover" alt="이미지안뜸"
							src="images/profileImage/${pvoTop3.mvo.profileImage}" style="width: 4rem; height: 4rem;"> ${pvoTop3.mvo.userName}<br></a>
							
					<%-- 작성일 : ${pvoTop3.regdate} <br> --%>
					<!-- 이하 좋아요 개수 표시 코드 수정필요 -->
									<c:set var="contains2" value="0" />
										<c:forEach var="email2" items="${requestScope.list2}">
										  <c:if test="${email2 eq pvoTop3.no}">
										    <c:set var="contains2" value="1" />
										  </c:if>
										</c:forEach>
					<div id="like-display" style="margin-left: 3rem; display:flex;">
											<c:choose>
											    <c:when test="${contains2 eq 1}">
											    <!-- <div class="area-desc" style="width: 50px; height: 50px;"> -->
													  <div class="area-desc">
															<span><img class="img${pvoTop3.no }" src ="images/contentImage/like.png" width = "25" height="25" onclick="startAjax(${pvoTop3.no})"><br></span>
													</div>
											    </c:when>
											    <c:otherwise>
														  <div class="area-desc">
														<span><img class="img${pvoTop3.no }" src ="images/contentImage/unlike.png" width = "25" height="25" onclick="startAjax(${pvoTop3.no})"><br></span>
														</div>
											    </c:otherwise>
											</c:choose>

<%-- 										<button onclick="myFunction(${pvo.no})">Click me</button> --%>
											<!-- 탑3 좋아요 플래그 안보이게함 -->
											<div class="likeBoolean${pvoTop3.no }" style="display: none;"></div>
											<c:set var="count2" value="${pvoTop3.likeCount}" />
<%-- 											좋아요 개수 : <div id="likeCount${pvo.no }"> ${pvo.likeCount}</div><br> --%>
											<div class="likeCount${pvoTop3.no }"  style="margin-left: 0.5rem;"> ${count2}</div>
										</div>
					<!-- end like-display -->
					</div>
					<!-- 작성일 -->
											<span style="margin-left: 8rem;">작성일 :  ${pvoTop3.regdate}</span>
					</div>
					</c:forEach>
					<br>
					<br>
					</div>
					</div>
					<!-- 좋아요 탑3 끝 -->
					
					
					<div class="main-feed" style="padding: 0 1rem 2rem 2rem; margin-right: -1rem; margin-left: -1rem;">
					<div class="row">
					
					<!-- 이미지 카드 한 칸 시작-->
						<c:forEach  items="${requestScope.list}" var="pvo" varStatus="status">
					<div class="col-md-4 ftco-animate" style="box-shadow: 0 2px 4px 0 rgb(216 216 216 / 20%), 0 16px 68px 0 rgb(216 216 216 / 40%)">
						<a href="images/contentImage/${pvo.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(images/contentImage/${pvo.postImage});">
								<div class="overlay">
								</div>
								</a>
								<div class="text ml-4 mb-4" style="display: inline-flex; align-items: center; margin-top: 0 !important;  margin-bottom: 0 !important;">
								
								<a href="ProfileDetailController.do?userEmail=${pvo.mvo.userEmail}"> <img class="image--cover" alt="이미지안뜸"
							src="images/profileImage/${pvo.mvo.profileImage}"
							style="width: 4rem; height: 4rem;"> ${pvo.mvo.userName}<br></a>
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
										<div id="like-display" style="margin-left: 3rem; display:flex;">
																					<c:choose>
											    <c:when test="${contains eq 1}">
													  <div class="area-desc">
															<span><img class="img${pvo.no }" src ="images/contentImage/like.png" width = "25" height="25" onclick="startAjax(${pvo.no})"><br></span>
													</div>
											    </c:when>
											    <c:otherwise>
														  <div class="area-desc">
														<span><img class="img${pvo.no }" src ="images/contentImage/unlike.png" width = "25" height="25" onclick="startAjax(${pvo.no})"><br></span>
														</div>
											    </c:otherwise>
											</c:choose>

<%-- 											<button  onclick="myFunction(${pvo.no})">Click me</button> --%>
											<!-- 좋아요 flag 안보이게함 -->
											<div class="likeBoolean${pvo.no }" style="display: none;">${contains }</div>
											
											<c:set var="count" value="${pvo.likeCount}" />
<%-- 											좋아요 개수 : <div id="likeCount${pvo.no }"> ${pvo.likeCount}</div><br> --%>
											<div class="likeCount${pvo.no }" style="margin-left: 0.5rem;" > ${count}</div>
<%-- 											<c:choose> --%>
<%-- 											    <c:when test="${contains eq 1}"> --%>
<!-- 														<img src="images/contentImage/like_up.png" height="20" width="20"> -->
<%-- 											    </c:when> --%>
<%-- 											    <c:otherwise> --%>
<!-- 														<img src="images/contentImage/like_down.png" height="20" width="20"> -->
<%-- 											    </c:otherwise> --%>
<%-- 											</c:choose> --%>
											<!-- 작성일 -->
											<span style="margin-left: 8rem;">작성일 :  ${pvo.regdate}</span>

										</div>
										
										</div>
									<!-- </span> -->
								</div>
								<hr>
									<!-- 내용 -->
									<div class="content">
									${pvo.content}
									</div>
							</div>	
						<!-- 사진 안에 글번호랑 좋아요 표시하려면 여기서 a태그 닫기 </a> -->
					</c:forEach>
				</div>
				</div>
			</div>			
		</section>
	
<script type="text/javascript">
let xhr;
$(document).ready(function(){
	
$(".area-desc").click(function() { 
	var arrowImage = $(this).children("span").children("img"); 
	arrowImage.attr("src", function(index, attr){
		if (attr.match('up')) {		
				return attr.replace("up", "down");
				
			} else {
				return attr.replace("down", "up");
			} 
		}); 
	});
})
//let no1;
function startAjax(no){	
	xhr=new XMLHttpRequest();//Ajax 통신을 위한 자바스크립트 객체 
	//no1 = no;
	const list = document.getElementsByClassName('likeBoolean'+no);
	myFunction(no);
	console.log(list)
	  // 현재 화면에 표시된 값
	 let like2 = list[0].innerText;
	 like2 = parseInt(like2);
	//alert(xhr);
	//XMLHttpRequest의 속성에 callback 함수를 바인딩
	//readystate가 변화될 때 callback 함수가 실행 
	//서버가 응답할 때 callback 함수를 실행하기 위한 코드이다 
	//xhr.onreadystatechange=callback; 
//		//서버로 요청 
	console.log(like2)
	xhr.open("GET","LikesCountServlet?no="+no+"&like="+like2);
	xhr.send(null); //post 방식일때 form data 명시 
}
function callback(){
	//console.log(xhr.readyState)
	// readyState 가 4 : 서버의 응답 정보를 받은 상태 
	// status 가 200 : 정상 수행 
	if(xhr.readyState==4&&xhr.status==200){
//			alert(xhr.responseText); // : 서버의 응답데이터를 저장하는 변수 
		document.getElementByClassName("likeCount"+no1).innerHTML = xhr.responseText;
	}
}
	function myFunction(no){
		  const list1 = document.getElementsByClassName('likeBoolean'+no);
		  const list2 = document.getElementsByClassName('likeCount'+no);
		  const list3 = document.getElementsByClassName('img'+no);
		  let number1 = 0;
		  let number2 = 0;
// 		  let number1 = resultElement1.innerText;
// 		  let number2 = resultElement2.innerText;
		  for (var i = 0; i < list1.length; i++) {
	 		  number1 = list1[i].innerText;
//	 		  let number2 = resultElement2.innerText;			  
		 	  if (number1 === '1'){
				  list1[i].innerText = 0;		  
				  number2 = parseInt(list2[i].innerText) - 1;
				  list2[i].innerText = number2;
				  list3[i].src = "images/contentImage/unlike.png";
			  }else{			  
// 					  resultElement1.innerText = 1;
// 				  number2 = parseInt(number2) + 1;
// 				  resultElement2.innerText = number2;
// 				  document.getElementsByClassName('img'+no).src = "images/contentImage/like_up.png";
				  list1[i].innerText = 1;		  
				  number2 = parseInt(list2[i].innerText) + 1;
				  list2[i].innerText = number2;
				  list3[i].src = "images/contentImage/like.png";
			  }
			}
		  
		  
// 		  if (number1 === '1'){
// 			  resultElement1.innerText = 0;		  
// 			  number2 = parseInt(number2) - 1;
// 			  resultElement2.innerText = number2;
// 			  document.getElementsByClassName('img'+no).src = "images/contentImage/like_down.png";
// 		  }else{			  
// 				  resultElement1.innerText = 1;
// 			  number2 = parseInt(number2) + 1;
// 			  resultElement2.innerText = number2;
// 			  document.getElementsByClassName('img'+no).src = "images/contentImage/like_up.png";
// 		  }
	}
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