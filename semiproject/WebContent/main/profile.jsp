<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script type="text/javascript">
function deletePost() {
    if (confirm("게시글을 삭제하시겠습니까?")) {
       //location.href='DeletePostController.do?no='+no;
       document.forms["deleteForm"].submit();
       //document.deleteForm.submit();
    }	
</script>


<style>
.item-wrap{
position:relative;
width:600px;
height:1800px;
border-radius:8px;
padding:20px;
margin:auto;
margin-top
}
</style>


<meta charset="UTF-8">
<title>현재 로그인한 유저정보</title>
<script type="text/javascript">
	function updatePost() {
			document.updateForm.submit();
	}
	function withdrawPost() {
		if (confirm("회원..탈퇴하시게요??")) 
		document.withdrawForm.submit();
}
	function deletePost() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			//location.href='DeletePostController.do?no='+no;
			document.forms["deleteForm"].submit();
			//document.deleteForm.submit();
		}
	}
</script>
<style>
	table{
		width :1000px;
		
		   margin-left: auto;
    	   margin-right: auto;
	}
	td{
		  margin-left: auto;
		
	}

	.buttonn{
		align:right;
		height: 40px; 
		width: 20%; 
	}

</style>
<!-- 내 프로필 출력 시작 -->
	<table >
	<tr>

	</tr>	
		<tr>
			<%-- default 이미지 설정해주기 --%>
			<td rowspan="2" style=" padding-top:3rem;"><img style="border-radius : 50%;" src="images/profileImage/${requestScope.vo.profileImage}" alt="My Image" width="200" height="200"></td>
			<td style="font-size:300%;" align=right>${requestScope.vo.userName}</td>
			
		</tr>
	
	<%-- 	<tr>
			<td style="font-size:150%;"  align=right>${requestScope.vo.userEmail}</td>
		</tr> --%>
		<tr>
			<td  style="font-size:150%;"  align=right>${requestScope.vo.profileContent}</td>
		</tr>
		<tr>
		<td style="align: left; padding-left: 7rem; padding-top:3rem;">게시물수 : ${requestScope.posts}</td>
		</tr>
	</table>
	<c:if test="${requestScope.vo.userEmail==sessionScope.mvo.userEmail}">
		
		<table>
			<tr style="float: right;">
			<td  class="btnArea">
				<form name="updateForm"
					action="${pageContext.request.contextPath}/UpdateProfileFormController.do" method="post">
					<input type="hidden" name="userEmail" value="${requestScope.vo.userEmail}">
				</form>
				
				<button type="button" class="btn"onclick="updatePost()">수정</button>
			
			</td>
			<td class="btnArea">
				<form name="withdrawForm"
					action="${pageContext.request.contextPath}/LeaveController.do" method="post">
					<input type="hidden" name="userEmail" value="${requestScope.vo.userEmail}">
				</form>
			
				<button type="button" class="btn" onclick="withdrawPost()">탈퇴</button>
			
			</td>
		</tr>
		</table>

		</c:if>
		<br><br>
		<!-- 내 프로필 출력 끝 -->
		
		<!-- 개인 피드 게시물 출력 -->
		
		<section class="ftco-section-3">
				<div class="photography">
				<div>
			
		<div class="row">
			
		<c:forEach items="${requestScope.list}" var="pvo" varStatus="status">
	
		<div class="col-md-4 ftco-animate" style="box-shadow: 0 2px 4px 0 rgb(216 216 216 / 20%), 0 16px 68px 0 rgb(216 216 216 / 40%)">
			글번호 : ${pvo.no} 
			
			<c:if test="${requestScope.vo.userEmail==sessionScope.mvo.userEmail}">
			<tr>
			<td colspan="5" class="btnArea">
				<!--  <form name="deleteForm"
					 method="post" action="${pageContext.request.contextPath}/DeletePostController.do?no=${pvo.no}">
					 <input type= "hidden" name= "no" value="${ pvo.no }">
					 <input type="submit" name= "no" placeholder="삭제"> 
				</form>-->
				<button type="button" class="btn" onclick="deletePost()">삭제</button> 
				
				<form name="deleteForm"
					 method="post" action="${pageContext.request.contextPath}/DeletePostController.do?no=${pvo.no}"></form>
					 <!-- <input type="submit" name= "no" placeholder="삭제"> -->
				
			<%-- 	<a href= "${pageContext.request.contextPath}/DeletePostController.do?no=${pvo.no}">삭제</a> --%>
				
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
			</a>
			
			<div class="overlay">
				</div>
			<div class="text ml-4 mb-4" style="display: inline-flex; align-items: center; margin-top: 0 !important;  margin-bottom: 0 !important;">
								
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