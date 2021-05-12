<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("이미 가입된 이메일 입니다!!");
	location.href = "${pageContext.request.contextPath}/RegisterController.do";
</script>