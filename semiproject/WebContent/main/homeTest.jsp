<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>

<script type="text/javascript">
	let xhr;
	$(document).ready(function(){
	$(".area-desc").click(function() { 
		var arrowImage = $(this).children("span").children("img"); 
		arrowImage.attr("src", function(index, attr){
			if (attr.match('up')) {		
					return attr.replace("up", "down");
					
				} else {
					return attr.replace("down", "up");
				} 
			}); 
		});
	})
	let no1;
	function startAjax(no){	
		xhr=new XMLHttpRequest();//Ajax 통신을 위한 자바스크립트 객체 
		no1 = no;
// 		const resultElement2 = document.getElementById('likeBoolean'+no1);
		myFunction(no);
		  
		  // 현재 화면에 표시된 값
// 		  let like2 = resultElement2.innerText;

// 		  like2 = parseInt(like2);
		//alert(xhr);
		//XMLHttpRequest의 속성에 callback 함수를 바인딩
		//readystate가 변화될 때 callback 함수가 실행 
		//서버가 응답할 때 callback 함수를 실행하기 위한 코드이다 
// 		xhr.onreadystatechange=callback; 
// 		//서버로 요청 
// 		xhr.open("GET","LikesCountServlet?no="+no+"&like="+like2);
// 		xhr.send(null); //post 방식일때 form data 명시 


	}
	function callback(){
		//console.log(xhr.readyState)
		// readyState 가 4 : 서버의 응답 정보를 받은 상태 
		// status 가 200 : 정상 수행 
		if(xhr.readyState==4&&xhr.status==200){
// 			alert(xhr.responseText); // : 서버의 응답데이터를 저장하는 변수 
			document.getElementById("likeCount"+no1).innerHTML = xhr.responseText;
		}
	}
		function myFunction(no){
			  const resultElement1 = document.getElementById('likeBoolean'+no);
			  const resultElement2 = document.getElementById('likeCount'+no);
			  let number1 = resultElement1.innerText;
			  let number2 = resultElement2.innerText;
			  console.log(number2);
			  if (number1 === '1'){
 				  resultElement1.innerText = 0;		  
				  number2 = parseInt(number2) - 1;
				  console.log(number2); 
				  resultElement2.innerText = number2;
			  }else{			  
 				  resultElement1.innerText = 1;
				  number2 = parseInt(number2) + 1;
				  resultElement2.innerText = number2;
			  }
		}
</script>


<c:forEach items="${requestScope.list}" var="pvo" varStatus="status">
번호 : ${pvo.no} <br>
사진 : <img src="images/contentImage/${pvo.postImage}" alt="My Image"
		width="100" height="200"> ${pvo.postImage} <br>
내용 : ${pvo.content}<br>
작성자 : ${pvo.mvo.userName}<br>
작성일 : ${pvo.regdate} <br>

<%-- <input type="hidden" id="postNum${pvo.no}" name="${pvo.no}" value="${pvo.no}"> --%>

<c:set var="contains" value="0" />
										<c:forEach var="email" items="${requestScope.list2}">
										  <c:if test="${email eq pvo.no}">
										    <c:set var="contains" value="1" />
										  </c:if>
										</c:forEach>
											<c:choose>
											    <c:when test="${contains eq 1}">
													  <div class="area-desc" style="width: 100px; height: 100px;">
															<span><img src ="images/contentImage/like_up.png" width = "50" height="50" onclick="startAjax(${pvo.no})"><br></span>
													</div>
											    </c:when>
											    <c:otherwise>
														  <div class="area-desc" style="width: 100px; height: 100px;">
														<span><img src ="images/contentImage/like_down.png" width = "50" height="50" onclick="startAjax(${pvo.no})"><br></span>
														</div>
											    </c:otherwise>
											</c:choose>
<%-- 											<button  onclick="myFunction(${pvo.no})">Click me</button> --%>
											좋아요 유무(0 or 1) : <div id="likeBoolean${pvo.no }">${contains }</div>
											<c:set var="count" value="${pvo.likeCount}" />
<%-- 											좋아요 개수 : <div id="likeCount${pvo.no }"> ${pvo.likeCount}</div><br> --%>
											좋아요 개수 : <div id="likeCount${pvo.no }"> ${count}</div>
	<hr>
	<hr>
</c:forEach>