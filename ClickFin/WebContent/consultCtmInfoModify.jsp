<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("잘못된 로그인");
		location.href("login.html");
		</script><%
		
	}%>
    
    <%String searchStr = (String)session.getAttribute("searchStr");//검색하려는 문자열
    	%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객관리 - 고객 개인정보수정</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>님 환영합니다.<br>
    <!-- <a href ="logout.jsp" >로그아웃</a> --></div>

<div id="container" style="width:1000px">
	<div id="header" style="font-size: 30px;text-align: center;">
	<%=searchStr %>고객님의 정보 수정
	</div>
	<div id="content">
	<form action="consultCtmInfoView.jsp">
	<table width="70%">
    	<tr>
    		<th>이름 : </th>
			<td><input type="text" name="consultMyName" value="<%//DB에서 불러온거로 SET %>"> </td>
		</tr>
    	<tr>
    		<th>성별 : </th>
    		<td><input type="text" value="<% %>"></td>
    	</tr>
    	<tr>
    		<th>주민번호 : </th>
    		<td><input type="text" value="<% %>"></td>
    	</tr>
    	<tr>
    		<th>연락처 : </th>
    		<td><input type="text" value="<% %>"></td>
    	</tr>
    	<tr>
    		<th>주소 : </th>
    		<td><input type="text" value=""></td>
    	</tr>
    	<tr>
    		<th>결혼유뮤 : </th>
    		<td><input type="text"></td>
    	</tr>
    	<tr>
    		<th>자녀</th>
    		<td>
    			<ol>
    				<li><input type="text"></li>
    				<li><input type="text"></li>
    			</ol>
    		</td>
    	</tr>
    	<tr>
    		<th>기념일</th>
    		<td></td>
    	</tr>
    	<tr>
    		<th>기타</th>
    		<td><input type="text"></td>
    	</tr>
	
	</table>
	
	<input type="submit" value="저장" ><!-- 확인 누를 때 저장했는지 물어보는거 추가 -->
	<input type="button" value="취소" 
		onclick="location.href='consultCtmInfoView.jsp'">
	</form>
	
	
	</div>
	<%session.removeAttribute(searchStr);%>
</div>

</body>
</html>