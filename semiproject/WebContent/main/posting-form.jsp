<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%--(재훈)
	포스팅화면. 
	
	사진, 내용
	
 --%>
 
 
<div class="row block-9" style="margin-top:100px; margin-bottom:100px;">
  <div class="col-md-6 d-flex" style="text-align: center; margin: 0 auto;">
  	<form action="UploadServlet" method="post" lass="bg-light p-5 contact-form" style="width: 100%" enctype="multipart/form-data">
     <div class="bg-light p-5 contact-form">
     <div class="form-group">
        File <input type="file" name="postImage" class="form-control" readonly="readonly"><br>
      </div>
      <div class="form-group" name="insertFrm">
        Content <textarea cols="120" rows="8" name="content" class="form-control"></textarea><br>
      </div>
      <div class="form-group">
        <input type="submit" value="포스팅 업로드!" class="btn btn-primary py-3 px-5">
 	</div>
 	</div>
 	</form>
</div>
</div>
