<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%-- 이미지 업로드 처리 
	
	예외처리?
	1. 중복된 파일명이 업로드 될때
	
 --%>
 
 
 
  <jsp:forward page="WritePostController.do?post_image=${post_image}&&content=${content}"></jsp:forward>