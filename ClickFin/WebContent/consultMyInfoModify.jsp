<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>������Ʈ ������ ����</title>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>
</head>

<body>
<br>
    <div style = "text-align:right" ><%=id %>�� ȯ���մϴ�.<br>
    <!-- <a href ="logout.jsp" >�α׾ƿ�</a> --></div>

<div id="container" style="width:1000px">
	<div id="header" style="font-size: 30px;text-align: center;">
	�� ���� ����
	</div>
	<div id="content">
	<form action="consultMyInfoModifyOK.jsp">
	<table>
    	<tr>
    		<th>�̸� : </th>
			<td><input type="text" value="<%=name%>" name="consultMyName" > </td>
		</tr>
    	<tr>
    		<th>��ȭ��ȣ : </th>
    		<td><input type="text" value="<%=phone %>" name="consultMyPhone" ></td>
    	</tr>
    	<tr>
    		<th>�ּ� : </th>
    		<td><input type="text" value="<%=address %>" name="consultMyAddress" ></td>
    	</tr>
    	<tr>
    		<th>�̸��� : </th>
    		<td><input type="text" value="<%=email %>" name="consultMyEmail" ></td>
    	</tr>
	
	</table>
	
	
	<input type="submit" value="����" ><!-- Ȯ�� ���� �� �����ߴ��� ����°� �߰� -->
	<input type="button" value="���" onclick="location.href='consultMyInfoView.jsp'">
	
	</form>
	</div>
	
	
</div>
</body>
</html>