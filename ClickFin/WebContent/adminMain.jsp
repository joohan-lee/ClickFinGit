<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%
	String user_id = (String)session.getAttribute("userId");
	if(user_id == null || user_id.equals(""))
	{
		%><script>alert("잘못된 로그인");
		parent.location.href("login.html");
		</script><%
		
	}
	%>


<div style = "text-align:right" ><%=user_id %>님 환영합니다.<br>
<a href ="logout.jsp">로그아웃</a>
</div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

</body>
</html>