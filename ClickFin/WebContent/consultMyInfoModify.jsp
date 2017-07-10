<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
	<%
	String id = (String)session.getAttribute("userId");
	String name = (String)session.getAttribute("consultantName");
	String phone = (String)session.getAttribute("consultantPhone");
	String address = (String)session.getAttribute("consultantAddress");
	String email = (String)session.getAttribute("consultantEmail");
	%>

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>컨설턴트 내정보 수정</title>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>
</head>

<body>
<br>
    <div style = "text-align:right" ><%=id %>님 환영합니다.<br>
    <!-- <a href ="logout.jsp" >로그아웃</a> --></div>

<div id="container" style="width:1000px">
	<div id="header" style="font-size: 30px;text-align: center;">
	내 정보 수정
	</div>
	<div id="content">
	<form action="consultMyInfoModifyOK.jsp" method="post">
	<table>
    	<tr>
    		<th>이름 : </th>
			<td><input type="text" value="<%=name%>" name="consultMyName" > </td>
		</tr>
    	<tr>
    		<th>전화번호 : </th>
    		<td><input type="text" value="<%=phone %>" name="consultMyPhone" 
    			maxlength="11" onkeyPress="InputOnlyNumber(this);"></td>
    	</tr>
    	<tr>
    		<th>주소 : </th>
    		<td><input type="text" value="<%=address %>" name="consultMyAddress" ></td>
    	</tr>
    	<tr>
    		<th>이메일 : </th>
    		<td><input type="text" value="<%=email %>" name="consultMyEmail" ></td>
    	</tr>
	
	</table>
	
	
	<input type="submit" value="저장" ><!-- 확인 누를 때 저장했는지 물어보는거 추가 -->
	<input type="button" value="취소" onclick="location.href='consultMyInfoView.jsp'">
	
	</form>
	</div>
	<script>
               function InputOnlyNumber(obj){
                  if(event.keyCode>=48&&event.keyCode<=57){
                     //숫자키만입력
                     return true;
                  }
                  else{
                    event.returnValue=false;
                  }
                  
               }
               
      </script>
	
</div>
</body>
</html>