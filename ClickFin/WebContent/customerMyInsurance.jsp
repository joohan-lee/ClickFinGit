<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("insId");
	String user_id = (String)session.getAttribute("userId");%>
<div style = "text-align:right" ><%=user_id %>�� ȯ���մϴ�.<br>
<a href ="logout.jsp">�α׾ƿ�</a>
</div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<nav id ="topmenu"> 

	<ul>
	<li><img src="HSR logo.png"></li>
		
	  <li class="topmenuLi">
	    <a class="menulink" href="#">��������</a>
			<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfo.jsp" class="submenulink">�� ����</a></li>
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
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	ResultSet rs1 = null;	//������� id, �̸�, �������, ��ȣ, �ּ�, �̸����ּҸ� �������� ���� resultset
	ResultSet rs2 = null;	//������Ʈ�� �̸�, ��ȣ, �̸����ּҸ� �������� ���� resultset
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		out.print(id);
		rs1 = stmt.executeQuery("SELECT id, name, period, user_id FROM insurance WHERE id = '"+ id  +"'");
		%><table>
    	<thead>
			<th>�����ȣ</th>
			<th>��ǰ�̸�</th>
			<th>���ԱⰣ</th>
			<th>ȸ��</th>
			<th>�����</th>
			<th>����Ⱓ</th>
			<th>���峻��</th>
    	</thead>
		<tbody id="customTbody">
		<%
		rs1.next();

		String insId = rs1.getString("id");
		String name = rs1.getString("name");
		String period = rs1.getString("period");

		rs2 = stmt.executeQuery("select company, fee, period, ensure from insurance_product where name ='"+ name +"'");
		rs2.next();
		String company = rs2.getString("company");
		String fee = rs2.getString("fee");
		String insPeriod = rs2.getString("period");
		String ensure = rs2.getString("ensure");
		
		out.println("<td>" + insId + "</td>");
		out.println("<td>" + name + "</td>");
		out.println("<td>" + period + "</td>");
		out.println("<td>" + company + "</td>");
		out.println("<td>" + fee + "</td>");
		out.println("<td>" + insPeriod + "</td>");
		out.println("<td>" + ensure + "</td>");
		out.println("</tr>");
		%></tbody></table><%
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("�������");
	}

%>
</body>
</html>