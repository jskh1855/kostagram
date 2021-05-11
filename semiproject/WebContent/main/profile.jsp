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
