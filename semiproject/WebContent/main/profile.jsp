<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO" %>
<%@ page import="model.MemberVO" %>

<script type="text/javascript">
        function changeForm(val){
            if(val == "-1"){ // 뒤로 클릭시 메인화면으로 이동 
                location.href="index.jsp";
            }
        }
        
    </script>

   
<table>
            <tr>
                <td >이름</td>
                <td>${requestScope.vo.userName}</td>
            </tr>       
            <tr>
                <td>프로필사진</td> 
                <%-- default 이미지 설정해주기 --%>
                <td> <img src="images/profileImage/${requestScope.vo.profileImage}" alt="profileImage" width="100" height="100"> </td>
            </tr>
             <tr>
                <td>이메일</td>
                <td>${requestScope.vo.userEmail}</td>
            </tr>
               <tr>
                <td>자기소개</td>
                <td>${requestScope.vo.profileContent}</td>
            </tr>
        </table>
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
