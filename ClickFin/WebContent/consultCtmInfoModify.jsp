<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("�߸��� �α���");
		location.href("login.html");
		</script><%
		
	}%>
    
    <%String searchStr = (String)session.getAttribute("searchStr");//�˻��Ϸ��� ���ڿ�
    //String id = (String)session.getAttribute("userId");
	String name = (String)session.getAttribute("cusName");
	String rrn = (String)session.getAttribute("cusRrn");
	String phone = (String)session.getAttribute("cusPhone");
	String address = (String)session.getAttribute("cusAddress");
	String child = (String)session.getAttribute("cusChild");
	String anniversary = (String)session.getAttribute("cusAnniversary");
	String marry = (String)session.getAttribute("cusMarry");
    	%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - �� ������������</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>�� ȯ���մϴ�.<br>
    <!-- <a href ="logout.jsp" >�α׾ƿ�</a> --></div>

<div id="container" style="width:1000px">
	<div id="header" style="font-size: 30px;text-align: center;">
	<%=searchStr %>������ ���� ����
	</div>
	<div id="content">
	<form action="consultCtmInfoModifyOK.jsp">
	<table width="70%">
    	<tr>
    		<th>�̸� : </th>
			<td><input type="text" value="<%=name%>" name="cusMyName" value="<%//DB���� �ҷ��°ŷ� SET %>"> </td>
		</tr>
    	<tr>
    		<th>�ֹι�ȣ : </th>
    		<td><input type="text" value="<%=rrn %>" name="cusMyRrn" ></td>
    	</tr>
    	<tr>
    		<th>����ó : </th>
    		<td><input type="text" value="<%=phone %>" name="cusMyPhone" ></td>
    	</tr>
    	<tr>
    		<th>�ּ� : </th>
    		<td><input type="text" value="<%=address%>" name="cusMyAddress" ></td>
    	</tr>
    	<tr>
    		<th>��ȥ���� : </th>
    		<td><input type="text" value="<%=marry%>" name="cusMyMarry" ></td>
    	</tr>
    	<tr>
    		<th>�ڳ�: </th>
    			<td><input type="text" value="<%=child%>" name="cusMyChild" ></td>
    	</tr>
    	<tr>
    		<th>�����</th>
    		<td><input type="text" value="<%=anniversary%>" name="cusMyAnniversary" ></td>
    	</tr>
	</table>
	
	<input type="submit" value="����" ><!-- Ȯ�� ���� �� �����ߴ��� ����°� �߰� -->
	<input type="button" value="���" 
		onclick="location.href='consultCtmInfoView.jsp'">
	</form>
	
	
	</div>
	<%session.removeAttribute(searchStr);%>
</div>

</body>
</html>