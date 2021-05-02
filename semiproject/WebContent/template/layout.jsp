<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>board</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css">
</head>
<body>
<!-- container-fluid: 화면 너비와 상관없이 항상 100% -->
<div class="container-fluid">
  <div class="row header">
    <div class="col-sm-8 col-sm-offset-2" align="right">
   	<c:import url="/template/header.jsp"></c:import>
    </div>    
  </div>
  <div class="row main">   
	<c:import url="${url}"></c:import>
  </div>
  <div class="row footer">
    <div class="col-sm-8 col-sm-offset-2" align="right">
   	<c:import url="/template/footer.jsp"></c:import>
    </div>    
  </div>
</div>
</body>
</html>