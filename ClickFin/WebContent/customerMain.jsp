<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%
	String user_id = (String)session.getAttribute("userId");
	if(user_id == null || user_id.equals(""))
	{
		%><script>alert("�߸��� �α���");
		parent.location.href("login.html");
		</script><%
		
	}
	%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="style.css" />
<nav id ="topmenu"> 

	<ul>
	<li><img src="HSR logo.png"></li>
		
	  <li class="topmenuLi">
	    <a class="menulink" href="#">��������</a>
			<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfo.jsp" class="submenulink">�� ����&nbsp;&nbsp;&nbsp;</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfoModify.jsp" class="submenulink">�� ���� ����&nbsp;&nbsp;</a></li>
			</ul>
		</li>
			<li>|</li>
	<li class="topmenuLi">
		<a class="menulink" href="#">��ǰ�� ��Ȳ ����</a>
			<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyProductAll.jsp" class="submenulink">���Ի�ǰ ��ü ��Ȳ</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">��ǰ�� �� ��Ȳ</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink" >Ÿ��ǰ �� ��Ȳ</a></li>
				
			</ul>
		</li>
			<li>|</li>
	</ul> 

</nav>
<title>Ŭ���� �� ���</title>
</head>
<body>
<div class ="loginSquare"><br><br><%=user_id %></b> �� ȯ���մϴ� ! <br>�ֱ� ���� : 2017.07.06 <br> ����ȸ�� 3 / 1111<br>
    </div>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" onClick="location.href = 'logout.jsp'" value="�α׾ƿ�" >
&nbsp;&nbsp;
<input type="button" onClick="location.href = 'logout.jsp'" value="���� ������">         
 
   <div class = "menuSquare"></div>
</body>
</html>