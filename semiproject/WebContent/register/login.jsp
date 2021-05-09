<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<div class="row block-9" style="margin-top:100px; margin-bottom:100px;">
		<div class="col-md-6 d-flex" style="text-align: center; margin: 0 auto;">
			<form method="post" action="${pageContext.request.contextPath}/LoginController.do" class="bg-light p-5 contact-form">
				<div class="form-group">
					<input type="text" name="userEmail" class="form-control" placeholder="이메일">
				</div>
				<div class="form-group">
					<input type="password" name="userPassword" class="form-control" placeholder="패스워드">
				</div>
				<div class="form-group">
					<input type="submit" value="로그인"
						class="btn btn-primary py-3 px-5">
					<a src="register/register.jsp"></a>
				</div>
					
				<div class="form-group">
					<input type="button" value = "회원가입할래?" class="btn btn-primary py-3 px-5" onclick="location.href='register.jsp'">
				</div>

			</form>

		</div>
	</div>

]