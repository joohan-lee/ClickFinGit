<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String id = "";
	id = (String)session.getAttribute("userId");
	String consultMyName = request.getParameter("consultMyName");
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������Ʈ ����������</title>
 <meta charset="UTF-8">
<link rel="stylesheet" href="navbar.css">
</head><font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
</style>

<body>
	<br>
    <div style = "text-align:right" ><%=id %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp" >�α׾ƿ�</a></div>
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;float:left;">
    <ul id="navi">
        <li class="group">
            <div class="title">������Ʈ</div>
            <ul class="sub">
                <li><a href="consultMyInfoView.jsp">��������</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">������</div>
            <ul class="sub">
                <li><a href="consultShowAllCustom.jsp">�� ��ü ��Ȳ</a></li>
                <li><a href="consultCtmPsnInfo.jsp">���� ��������</a></li>
                <li><a href="#">���� ���Ի�ǰ��Ȳ</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">��ǰ�� ��Ȳ</div>
            <ul class="sub">
                <li><a href="#">����</a></li>                
                <li><a href="#">����</a></li>
                <li><a href="#">�ݵ�</a></li>
                <li><a href="#">���� ����</a></li>
                <li><a href="#">��Ÿ</a></li> 
            </ul>
        </li>          
    </ul>
    </div>
    <div id="content" style="text-align: left;width:500px;float:left;margin-left:30px;" >
    	<table>
    	<tr>
    		<th>�̸� : </th>
    		<td><%=consultMyName %><!-- DB���� �޾ƿ��� --> </td>
    	</tr>
    	<tr>
    		<th>��ȭ��ȣ : </th>
    		<td>010-1234-5678 </td>
    	</tr>
    	<tr>
    		<th>�ּ� : </th>
    		<td>����Ư���� ������ </td>
    	</tr>
    	<tr>
    		<th>�̸��� : </th>
    		<td>abc@naver.com</td>
    	</tr>
    	</table>
    </div>
</div>
<form>
	<input type="button" value="������������" 
	onclick="location.href='http://SaucK:8080/ClickFin/consultMyInfoModify.jsp'" >
</form>
</body>
</html>