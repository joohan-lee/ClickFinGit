<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("�߸��� �α���");
		location.href("login.html");
		</script><%
		
	}
	%>
    <%String searchStr = (String)session.getAttribute("searchStr"); %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - �� ���� ��ǰ ������</title>


</head>

<style>
tr, td, th{
	border:1px gray solid;
}
th{
	background:#E9E6E6;
}
</style>


<body>

<div id="content" style="width:400px">
	<h1><%=searchStr%>�� �����ǰ ����</h1>
	<table style="border-collapse:collapse;border:1px gray solid;
		text-align: center;height:500px;width:400px;float:center;">
		<tr>
			<th>ȸ��</th>
			<td></td>
		</tr>
		<tr>
			<th>��ǰ��</th>
			<td>170705-170805</td>
		</tr>
		<tr>
			<th>���ԱⰣ</th>
			<td></td>
		</tr>
		<tr>
			<th>������/���ݾ�</th>
			<td></td>
		</tr>
		<tr>
			<th>���� �����ݾ�</th>
			<td></td>
		</tr>
		<tr>
			<th>���� ����ݾ�</th>
			<td></td>
		</tr>
		<tr>
			<th>���� ��ĵ��</th>
			<td></td>
		</tr>
	</table>
	
	<form action="">
		<input type="button" value="Ȯ��" onclick="history.back();" 
			style="position:relative;left:50%;margin:10px" >
		<input type="button" value="�����ϱ�" onclick="location.href='consultCtmInvestModify.jsp'"
			style="float:right;margin-top:10px" > 
	</form>
</div>

</body>
</html>