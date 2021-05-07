<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 페이지입니다.</h1>
<form action="/semiproject/user?cmd=join" method="POST">
	<input type="text" name="name" placeholder="이름" /><br />
	<input type="password" name="password" placeholder="패스워드" /><br />
	<input type="email" name="email" placeholder="이메일"  /><br />
	<input type="submit" />
</form>
</body>
</html>