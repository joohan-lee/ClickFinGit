<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% String userId = "";
	userId = (String)session.getAttribute("userID");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("�߸��� �α���");
		location.href("login.html");
		</script><%
		
	}%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��������</title>
<link rel="stylesheet" href="navbar.css">

</head>
<body>

</body>
</html>