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
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - �� ���� ��ǰ ����������</title>


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
	<form action="//�� ��ǰ����, ���� ���� jsp�� ����" method="post">
	<table style="border-collapse:collapse;border:1px gray solid;
		text-align: center;float:center;">
		<tr>
			<th>��ǰ��</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>���ڱⰣ</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>���ڱݾ�</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>���ڼ��ͷ�</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>����������</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>�����޹���</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>�����޹���</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>�߰����޹���</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>���� ��ĵ�� ���ε�</th>
			<td><input type="file" name="//���� �޾ƿ� jsp���� �̿��� name"></td>
		</tr>
	</table>
	<input type="submit" value="����" onclick="history.back();"
		style="float:right;margin-top:10px">
	
	</form>
	
</div>
</body>
</html>