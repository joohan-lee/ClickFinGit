<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
    <%
	String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("잘못된 로그인");
		location.href("login.html");
		</script><%
		
	}
	%>
    <%String searchStr = (String)session.getAttribute("searchStr"); %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 저축상품 등록</title>


</head>

<style>
tr, td, th{
	border:1px gray solid;
}
th{
	background:#E9E6E6;
}
td input{
	width:100%;
	height:100%;
	border:0;
}
</style>


<body>

<div id="content" style="width:400px">
	<h1><%=searchStr%>고객 저축상품 등록</h1>
	<form action="//고객 상품정보, 증서 보낼 jsp로 전송" method="post">
	<table style="border-collapse:collapse;border:1px gray solid;
		text-align: center;float:center;">
		<tr>
			<th>회사</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>납입기간</th>
			<td><input type="text" name="" width="45%">
			/<input type="text" name="" width="45%"></td>
		</tr>
		<tr>
			<th>보험증서 스캔본 업로드</th>
			<td><input type="file" name="//파일 받아올 jsp에서 이용할 name"></td>
		</tr>
	</table>
	<input type="button" value="취소" onclick="history.back();"
		style="float:right;margin:10px">
	<input type="submit" value="등록" onclick="history.back();"
		style="float:right;margin:10px">
	</form>
	
</div>

</body>
</html>