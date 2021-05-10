<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div>홈테스트~</div>


<%--출력을 뭐해야하나 포스트 no, 이미지, content, 좋아요 유무, 좋아요 갯수,  --%>

<c:forEach var="pvo" items="${requestScope.list}">
번호 : ${pvo.no} <br>
사진 : ${pvo.post_image}<br>
내용 : ${pvo.content}<br>
작성자 : ${pvo.mvo.userName}<br>
작성일 : ${pvo.regdate} <br>
로그인유저의  <br>
좋아요 유무(0 or 1) : <%-- BoardDAO.getInstance().likeCheck(${pvo.no}, ${sessionScope.mvo.userEmail}) --%> <br>
좋아요 개수 : <br>
<hr>
</c:forEach>
