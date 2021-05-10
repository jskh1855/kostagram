<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- <form action="/semiproject/user?cmd=join" method="POST"> -->
<!-- 	<input type="text" name="name" placeholder="이름" /><br /> -->
<!-- 	<input type="password" name="password" placeholder="패스워드" /><br /> -->
<!-- 	<input type="email" name="email" placeholder="이메일"  /><br /> -->
<!-- 	<input type="submit" /> -->
<!-- </form> -->



<div class="row block-9" style="margin-top:100px; margin-bottom:100px;">
		<div class="col-md-6 d-flex" style="text-align: center; margin: 0 auto;">
			<form method="post" action="/semiproject/user?cmd=join" class="bg-light p-5 contact-form" style="width: 100%">
				<div class="form-group">
	<input type="text" name="name" placeholder="이름" /><br />
				</div>
				<div class="form-group">
	<input type="password" name="password" placeholder="패스워드" /><br />
				</div>
				<div class="form-group">
		<input type="email" name="email" placeholder="이메일"  /><br />
				</div>
				<div class="form-group">
	<input type="submit" class="btn btn-primary py-3 px-5" />
				</div>
			</form>

		</div>
	
	</div>