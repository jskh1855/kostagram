<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

 <form action="${pageContext.request.contextPath}/UpdateProfileController.do" method="post" >

 

 <input type="hidden" name=email value="${mvo.userEmail}"></input>   

<table class="table" >

<div class="info">

	<form >

		<div class="form-group">

			<label for="profileImage">프로필 이미지</label>

			<input type="text" class="form-control w200" id="profileImage" 

				name="profileImage" placeholder="프로필이미지" value="${requestScope.mvo.profileImage}" />

		</div>

		<div class="form-group">

			<label for="profileContent">자기소개</label>

			<input type="text" class="form-control w200" id="profileContent" 

				name="profileContent" placeholder="자기소개" value="${requestScope.mvo.prifileContent}" />

		</div>

		</table>

		<button type="submit" class="btn">수정</button>

		<button type="reset" class="btn" >취소</button> 

	</form>

</div>	

 --%>

 

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

    

 

    <%-- <tr>

     <td>자기소개 &nbsp;&nbsp;     

     <textarea cols="120" rows="15" name="profilecontent" required="required" >${vo.profileContent }</textarea>

     </td>

    </tr>  --%>

 

<div class="row block-9" style="margin-top:100px; margin-bottom:100px;">

		<div class="col-md-6 d-flex" style="text-align: center; margin: 0 auto;">

 <form action="${pageContext.request.contextPath}/UpdateProfileImageServlet" method="post" enctype="multipart/form-data" class="bg-light p-5 contact-form" style="width: 100%">

 <input type="hidden" name=userEmail value="${vo.userEmail}"></input>   

   <table class="table" >

   <div class="form-group">

			<label for="profileImage">프로필 이미지</label>

			<input type="file" class="form-control w200" id="profileImage" 
${vo.profileImage}
				name="profileImage" placeholder="${vo.profileImage}" value="${vo.profileImage}" />

		</div>

		   <div class="form-group" >

         <label for="profileContent" >자기소개</label> 

         <input type="text" class="form-control w200" id="profileContent" name="profileContent"

            placeholder="자기소개" value="${vo.profileContent}" />

      </div>

   

  

   

    <%-- <tr>

     <td>자기소개 &nbsp;&nbsp;     

     <textarea cols="120" rows="15" name="profilecontent" required="required" >${vo.profileContent }</textarea>

     </td>

    </tr>  --%>

     </table>    

     <div class="form-group">

     <button type="submit" class="btn btn-primary py-3 px-5" >수정</button>  

     <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-primary py-3 px-5">취소</a> 

    </div>  

  </form>

 

</div>

</div>