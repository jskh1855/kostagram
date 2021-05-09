<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>board</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff"
	rel="stylesheet">

<link rel="stylesheet" href="../main/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../main/css/animate.css">

<link rel="stylesheet" href="../main/css/owl.carousel.min.css">
<link rel="stylesheet" href="../main/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../main/css/magnific-popup.css">

<link rel="stylesheet" href="../main/css/aos.css">

<link rel="stylesheet" href="../main/css/ionicons.min.css">

<link rel="stylesheet" href="../main/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../main/css/jquery.timepicker.css">


<link rel="stylesheet" href="../main/css/flaticon.css">
<link rel="stylesheet" href="../main/css/icomoon.css">
<link rel="stylesheet" href="../main/css/style.css">
</head>
<form method="post"
	action="${pageContext.request.contextPath}/LoginController.do">
	<input type="text" name="userEmail" placeholder="아이디" size="24">
	<input type="password" name="userPassword" placeholder="비밀번호" size="24"><br>
	<input type="submit" value="로그인">
</form>
<form method="post" action="register/register.jsp">
	<input type="submit" value="회원가입">
	
	
</form>
<div class="row block-9">
		<div class="col-md-6 d-flex">
			<form action="#" class="bg-light p-5 contact-form">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Your Name">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Your Email">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Subject">
				</div>
				<div class="form-group">
					<textarea name="" id="" cols="30" rows="7" class="form-control"
						placeholder="Message"></textarea>
				</div>
				<div class="form-group">
					<input type="submit" value="Send Message"
						class="btn btn-primary py-3 px-5">
				</div>
			</form>

		</div>
	</div>
	<!-- <footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container px-md-5">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Recent Photos</h2>
						<ul class="list-unstyled photo">
							<li><a href="#" class="img"
								style="background-image: url(images/image_1.jpg);"></a></li>
							<li><a href="#" class="img"
								style="background-image: url(images/image_2.jpg);"></a></li>
							<li><a href="#" class="img"
								style="background-image: url(images/image_3.jpg);"></a></li>
							<li><a href="#" class="img"
								style="background-image: url(images/image_4.jpg);"></a></li>
							<li><a href="#" class="img"
								style="background-image: url(images/image_5.jpg);"></a></li>
							<li><a href="#" class="img"
								style="background-image: url(images/image_6.jpg);"></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer> -->
<script src="../main/js/jquery.min.js"></script>
<script src="../main/js/jquery-migrate-3.0.1.min.js"></script>
<script src="../main/js/popper.min.js"></script>
<script src="../main/js/bootstrap.min.js"></script>
<script src="../main/js/jquery.easing.1.3.js"></script>
<script src="../main/js/jquery.waypoints.min.js"></script>
<script src="../main/js/jquery.stellar.min.js"></script>
<script src="../main/js/owl.carousel.min.js"></script>
<script src="../main/js/jquery.magnific-popup.min.js"></script>
<script src="../main/js/aos.js"></script>
<script src="../main/js/jquery.animateNumber.min.js"></script>
<script src="../main/js/bootstrap-datepicker.js"></script>
<script src="../main/js/jquery.timepicker.min.js"></script>
<script src="../main/js/scrollax.min.js"></script>
<script
	src="../main/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="../main/js/google-map.js"></script>
<script src="../main/js/main.js"></script>
</body>
</html>