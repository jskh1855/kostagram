<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<meta charset="UTF-8">
<title>현재 로그인한 유저정보</title>
<script type="text/javascript">
	function updatePost() {
			document.updateForm.submit();
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
			<td><img src="images/profileImage/${requestScope.vo.profileImage}" alt="My Image" width="100" height="200"></td>
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
			<tr>
			<td colspan="5" class="btnArea">
				<form name="updateForm"
					action="${pageContext.request.contextPath}/UpdateProfileFormController.do" method="post">
					<input 	type="hidden" name="userEmail" value="${requestScope.vo.userEmail}">
				</form>
				<button type="button" class="btn" onclick="updatePost()">수정</button>
			</td>
		</tr>
		<br><br><!-- 개인 피드 게시물 출력 -->
		
		<section class="ftco-section-3">
				<div class="photography">
				<div style="background-color: lightgray; margin-bottom: 1rem;">
		<div class="row">
	<c:forEach items="${requestScope.list}" var="pvo" varStatus="status">
	${pvo} 
		<div class="col-md-4 ftco-animate">
		<!-- images/contentImage/ -->
			<a href="images/contentImage/${pvo.postImage}"
				class="photography-entry img image-popup d-flex justify-content-start align-items-end"
				style="background-image: url(images/contentImage/${pvo.postImage});">
				<div class="overlay">
				</div>
			</a>
			<div class="text ml-4 mb-4" style="display: inline-flex;">
				<%-- 								<h3>글번호 ${pvo.no}</h3> --%>
				<span class="tag"> <c:set var="contains" value="0" /> 
				<c:forEach
						var="email" items="${requestScope.list2}">
						<c:if test="${email eq pvo.no}">
							<c:set var="contains" value="1" />
						</c:if>
					</c:forEach> <!-- 좋아요 아이콘이랑 개수 float: right 하고픔 -->
					<div id="like-display">
						<c:choose>
							<c:when test="${contains eq 1}">
								<img src="images/contentImage/like.png" height="20" width="20">
							</c:when>
							<c:otherwise>
								<img src="images/contentImage/dislike.png" height="20"
									width="20">
							</c:otherwise>
						</c:choose>
						${status.index}
					</div>
				</span>
			</div>
		</div>
		<!-- 사진 안에 글번호랑 좋아요 표시하려면 여기서 a태그 닫기 </a> -->
	</c:forEach>
	<!--  -->
	<!-- <div class="row"> -->
					<c:forEach  items="${requestScope.list}" var="pvo" varStatus="status">
					<%-- ${pvoTop3 } --%>
					<div class="col-md-4 ftco-animate">
					<a href="images/contentImage/${pvo.postImage}" class="photography-entry img image-popup d-flex justify-content-start align-items-end" style="background-image: url(images/contentImage/${pvo.postImage});">
								<div class="overlay">
								</div>
								</a>
					<%-- 내용 : ${pvoTop3.content}<br> --%>
					작성자 : ${pvo.mvo.userName}<br>
					<%-- 작성일 : ${pvoTop3.regdate} <br> --%>
					<div id="like-display">
						좋아요 유무(0 or 1)
						<!-- if else로 좋아요 아이콘 넣을 거임 -->
					    <%-- <c:set var="contains" value="1" /> --%>
						<c:choose>
						    <c:when test="${1 eq 1}">
						        좋아요 하얀 버튼
						    </c:when>
						    <c:otherwise>
						        좋아요 빨간 버튼
						    </c:otherwise>
						</c:choose>
						<!-- 좋아요 아이콘 끝 -->
						좋아요 개수 : <br>					
					</div>
					</div>
					</c:forEach>
					<br>
					<br>
					<!-- </div> -->
					
					
</div>
</div>
</div>
</section>
