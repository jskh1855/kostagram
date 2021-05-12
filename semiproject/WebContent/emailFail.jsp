<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert("이메일 인증이 필요합니다");
	location.href = "${pageContext.request.contextPath}/index.jsp";
</script>