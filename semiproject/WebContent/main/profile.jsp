<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<meta charset="UTF-8">
<title>현재 로그인한 유저정보</title>
<script type="text/javascript">
	function updatePost() {
			document.updateForm.submit();
	}
	function deletePost() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			//location.href='DeletePostController.do?no='+no;
			document.forms["deleteForm"].submit();
			//document.deleteForm.submit();
		}
	}
</script>

<!-- 내 프로필 출력 시작 -->
	<table>
		<tr>
			<td>이름</td>
			<td>${requestScope.vo.userName}</td>
		</tr>
		<tr>
			<td>프로필사진</td>
			<%-- default 이미지 설정해주기 --%>
			<td><img src="images/profileImage/${requestScope.vo.profileImage}" alt="My Image" width="200" height="200"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${requestScope.vo.userEmail}</td>
		</tr>
		<tr>
			<td>자기소개</td>
			<td>${requestScope.vo.profileContent}</td>
		</tr>
	</table>
	<c:if test="${requestScope.vo.userEmail==sessionScope.mvo.userEmail}">
			<tr>
			<td colspan="5" class="btnArea">
				<form name="updateForm"
					action="${pageContext.request.contextPath}/UpdateProfileFormController.do" method="post">
					<input type="hidden" name="userEmail" value="${requestScope.vo.userEmail}">
				</form>
				<button type="button" class="btn" onclick="updatePost()">수정</button>
			</td>
		</tr>
		</c:if>
		<br><br>
		<!-- 내 프로필 출력 끝 -->
		
		<!-- 개인 피드 게시물 출력 시작 -->
<section class="ftco-section-3">
<div class="photography">
   <div class="col-md-4 ftco-animate">
      <div class="main-feed"
         style="padding: 0 1rem 2rem 2rem; margin-right: -1rem; margin-left: -1rem;">
         <div class="row">

            <c:forEach items="${requestScope.list}" var="pvo" varStatus="status">
               <%-- 글번호 : ${pvo.no}  --%>
               
               <div class="col-md-4 ftco-animate"
                  style="box-shadow: 0 2px 4px 0 rgb(216 216 216/ 20%), 0 16px 68px 0 rgb(216 216 216/ 40%)">
                  <a href="images/contentImage/${pvo.postImage}"
                     class="photography-entry img image-popup d-flex justify-content-start align-items-end"
                     style="background-image: url(images/contentImage/${pvo.postImage});">
                     <div class="overlay"></div>
                  </a>
                  <%-- 원본
                     <a href="images/contentImage/${pvo.postImage}"
                        class="photography-entry img image-popup d-flex justify-content-start align-items-end"
                        style="background-image: url(images/contentImage/${pvo.postImage});">
                        <div class="overlay">
                        </div>
                     </a> --%>
                  <div class="text ml-4 mb-4"
                     style="display: inline-flex; align-items: center; margin-top: 0 !important; margin-bottom: 0 !important;">

                     <a
                        href="ProfileDetailController.do?userEmail=${pvo.mvo.userEmail}">
                        <img class="image--cover" alt="이미지안뜸"
                        src="images/profileImage/${pvo.mvo.profileImage}"
                        style="width: 4rem; height: 4rem;"> ${pvo.mvo.userName}<br>
                     </a> <span style="margin-left: 8rem;">작성일 : ${pvo.regdate}</span>
                  </div>
               </div>
               
         <!-- <hr> -->
         <div class="post-content">${pvo.content}</div>
         </div>
         
         </c:forEach>
      </div>
      
   </div>
   
   </div>
   
</section>
<!-- 개인 피드 게시물 출력 끝 -->
<script type="text/javascript">
   let xhr;
   $(document).ready(function() {

      $(".area-desc").click(function() {
         var arrowImage = $(this).children("span").children("img");
         arrowImage.attr("src", function(index, attr) {
            if (attr.match('up')) {
               return attr.replace("up", "down");

            } else {
               return attr.replace("down", "up");
            }
         });
      });
   })
   function startAjax(no) {
      xhr = new XMLHttpRequest();//Ajax 통신을 위한 자바스크립트 객체 
      //no1 = no;
      const resultElement2 = document.getElementById('likeBoolean' + no);
      myFunction(no);

      // 현재 화면에 표시된 값
      let like2 = resultElement2.innerText;
      like2 = parseInt(like2);
      //alert(xhr);
      //XMLHttpRequest의 속성에 callback 함수를 바인딩
      //readystate가 변화될 때 callback 함수가 실행 
      //서버가 응답할 때 callback 함수를 실행하기 위한 코드이다 
      //xhr.onreadystatechange=callback; 
      //      //서버로 요청 
      xhr.open("GET", "LikesCountServlet?no=" + no + "&like=" + like2);
      xhr.send(null); //post 방식일때 form data 명시 
   }
   function callback() {
      //console.log(xhr.readyState)
      // readyState 가 4 : 서버의 응답 정보를 받은 상태 
      // status 가 200 : 정상 수행 
      if (xhr.readyState == 4 && xhr.status == 200) {
         //         alert(xhr.responseText); // : 서버의 응답데이터를 저장하는 변수 
         document.getElementByClassName("likeCount" + no1).innerHTML = xhr.responseText;
      }
   }
   function myFunction(no) {
      const list1 = document.getElementsByClassName('likeBoolean' + no);
      const list2 = document.getElementsByClassName('likeCount' + no);
      const list3 = document.getElementsByClassName('img' + no);
      let number1 = 0;
      let number2 = 0;
      //         let number1 = resultElement1.innerText;
      //         let number2 = resultElement2.innerText;
      for (var i = 0; i < list1.length; i++) {
         number1 = list1[i].innerText;
         //            let number2 = resultElement2.innerText;           
         if (number1 === '1') {
            list1[i].innerText = 0;
            number2 = parseInt(list2[i].innerText) - 1;
            list2[i].innerText = number2;
            list3[i].src = "images/contentImage/unlike.png";
         } else {
            //                  resultElement1.innerText = 1;
            //               number2 = parseInt(number2) + 1;
            //               resultElement2.innerText = number2;
            //               document.getElementsByClassName('img'+no).src = "images/contentImage/like_up.png";
            list1[i].innerText = 1;
            number2 = parseInt(list2[i].innerText) + 1;
            list2[i].innerText = number2;
            list3[i].src = "images/contentImage/like.png";
         }
      }

      //         if (number1 === '1'){
      //            resultElement1.innerText = 0;        
      //            number2 = parseInt(number2) - 1;
      //            resultElement2.innerText = number2;
      //            document.getElementsByClassName('img'+no).src = "images/contentImage/like_down.png";
      //         }else{           
      //               resultElement1.innerText = 1;
      //            number2 = parseInt(number2) + 1;
      //            resultElement2.innerText = number2;
      //            document.getElementsByClassName('img'+no).src = "images/contentImage/like_up.png";
      //         }
   }
   $(document)
         .ready(
               function() {
                  $('.simple-ajax-popup-align-top').magnificPopup({
                     type : 'ajax',
                     alignTop : true,
                     overflowY : 'scroll' // as we know that popup content is tall we set scroll overflow by default to avoid jump
                  });
                  $('.simple-ajax-popup').magnificPopup({
                     type : 'ajax'
                  });
                  $('.popup-gallery')
                        .magnificPopup(
                              {
                                 delegate : 'a',
                                 type : 'image',
                                 tLoading : 'Loading image #%curr%...',
                                 mainClass : 'mfp-img-mobile',
                                 gallery : {
                                    enabled : true,
                                    navigateByImgClick : true,
                                    preload : [ 0, 1 ]
                                 // Will preload 0 - before current, and 1 after the current image
                                 },
                                 image : {
                                    tError : '<a href="%url%">The image #%curr%</a> could not be loaded.',
                                    titleSrc : function(item) {
                                       return item.el
                                             .attr('title')
                                             + item.el
                                                   .attr('content')
                                             + '<small>by Marsel Van Oosten</small>';
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