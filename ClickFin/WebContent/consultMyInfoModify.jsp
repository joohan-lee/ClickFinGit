<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("euc-kr"); %>

    <%
	String id = "";
	id = (String)session.getAttribute("userID");%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������Ʈ ������ ����</title>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>
</head>

<body>
<br>
    <div style = "text-align:right" ><%=id %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp" >�α׾ƿ�</a></div>

<div id="container" style="width:1000px">
	<div id="header" style="font-size: 30px;text-align: center;">
	�� ���� ����
	</div>
	<div id="content">
	<form action="consultMyInfoView.jsp">
	<table>
    	<tr>
    		<th>�̸� : </th>
			<td><input type="text" name="consultMyName" value="<%//DB���� �ҷ��°ŷ� SET %>"> </td>
		</tr>
    	<tr>
    		<th>��ȭ��ȣ : </th>
    		<td><input type="text" value="<% %>"></td>
    	</tr>
    	<tr>
    		<th>�ּ� : </th>
    		<td><input type="text" value="<% %>"></td>
    	</tr>
    	<tr>
    		<th>�̸��� : </th>
    		<td><input type="text" value="<% %>"></td>
    	</tr>
	
	</table>
	<input type="submit" value="����" ><!-- Ȯ�� ���� �� �����ߴ��� ����°� �߰� -->
	<!--  -->
	<input type="button" value="���" onclick="location.href='http://localhost:8081/ClickFin/consultMyInfoView.jsp'">
	
	</form>
	</div>
	
	
</div>
</body>
</html>