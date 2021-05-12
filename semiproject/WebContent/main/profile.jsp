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
					<input 	type="hidden" name="userEmail" value="${requestScope.vo.userEmail}">
				</form>
				<button type="button" class="btn" onclick="updatePost()">수정</button>
			</td>
		</tr>
		</c:if>
		<br><br><!-- 개인 피드 게시물 출력 -->
		
		<section class="ftco-section-3">
				<div class="photography">
				<div>
		<div class="row">
		
		<c:forEach items="${requestScope.list}" var="pvo" varStatus="status">
		
		<div class="col-md-4 ftco-animate">
			글번호 : ${pvo.no} 
			<c:if test="${requestScope.vo.userEmail==sessionScope.mvo.userEmail}">
			<tr>
			<td colspan="5" class="btnArea">
				<!--  <form name="deleteForm"
					 method="post" action="${pageContext.request.contextPath}/DeletePostController.do?no=${pvo.no}">
					 <input type= "hidden" name= "no" value="${ pvo.no }">
					 <input type="submit" name= "no" placeholder="삭제"> 
				</form>-->
				<a href= "${pageContext.request.contextPath}/DeletePostController.do?no=${pvo.no}">삭제</a>
				<!--  <button type="button" class="btn" onclick="deletePost()">삭제</button> -->
				<!-- <form name="deleteForm"
					 method="post" action="${pageContext.request.contextPath}/DeletePostController.do?no=${pvo.no}">
					 <input type="submit" name= "no" placeholder="삭제"> 
				</form> -->
			</td>
			</tr>
			</c:if>
			<br>
			<a href="images/contentImage/${pvo.postImage}"
				class="photography-entry img image-popup d-flex justify-content-start align-items-end"
				style="background-image: url(images/contentImage/${pvo.postImage});">
				<div class="overlay">
				</div>
			</a>
			<%-- <img src="images/contentImage/${pvo.postImage}" alt="My Image"
					width="100" height="200"><br> --%>
			내용 : ${pvo.content}<br>
			<%-- 작성자 : ${pvo.mvo.userName}<br> --%>
			작성일 : ${pvo.regdate} <br>
			
			<%-- <input type="button" value="좋아요~" onclick="startAjax(${pvo.no})"><br>
			<input type="hidden" id="postNum${pvo.no}" name="${pvo.no}" value="${pvo.no}"> --%>
			<!-- 로그인유저의 <br> 좋아요 유무(0 or 1) : <span id="likeBoolean"></span><br>
			좋아요 개수 : <span id="likeCount"></span><br> -->
			</div>
		</c:forEach>
	
					
					
</div>
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