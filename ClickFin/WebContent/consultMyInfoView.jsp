<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
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
</head>
<font size="20px" ,style="text-align: center">Click Fin _ ������Ʈ���</font>

<style>
</style>

<body>
	<br>
	<div style="text-align: right"><%=id %>�� ȯ���մϴ�.<br> <a
			href="logout.jsp">�α׾ƿ�</a>
	</div>
	<div id="container" style="width: 1000px;">
		<div id="menu" style="width: 200px; float: left;">
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
						<li><a href="consultCtmInfoView.jsp">���� ��������</a></li>
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

			<%
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users where id='" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
   	
   	//ResultSet get_type = st.executeQuery(get_type_Query);
   		%>

			<%
   		while(rs.next())
   	   	{
   			String name = rs.getString("name");
   			String phone = rs.getString("phone");
   			String address = rs.getString("address");
   			String email = rs.getString("email");
   	   		%>

			<%
session.setAttribute("consultantName", name); 
session.setAttribute("consultantPhone",phone );
session.setAttribute("consultantAddress", address);
session.setAttribute("consultantEmail", email);
%>




		</div>
		<div id="content"
			style="text-align: left; width: 500px; float: left; margin-left: 30px;">
			<h2>�� ����</h2>
			<table>
				<tr>
					<th>�̸� :</th>
					<td><%=name %><!-- DB���� �޾ƿ��� --></td>
				</tr>
				<tr>
					<th>��ȭ��ȣ :</th>
					<td><%=phone %></td>
				</tr>
				<tr>
					<th>�ּ� :</th>
					<td><%=address %></td>
				</tr>
				<tr>
					<th>�̸��� :</th>
					<td><%=email %></td>
				</tr>
			</table>
		</div>
	</div>

	<%}
   	   	
   	
   }catch(Exception e)
   {
   	out.println("ERROR");
   	e.printStackTrace();
   }
%>
	<form>
		<input type="button" value="������������"
			onclick="location.href='consultMyInfoModify.jsp'">
	</form>
</body>
</html>