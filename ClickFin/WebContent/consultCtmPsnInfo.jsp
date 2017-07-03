<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% String userId = "";
	userId = (String)session.getAttribute("userID");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("잘못된 로그인");
		location.href("login.html");
		</script><%
		
	}%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객별 개인정보</title>
<link rel="stylesheet" href="navbar.css">

</head>
<body>

</body>
</html>