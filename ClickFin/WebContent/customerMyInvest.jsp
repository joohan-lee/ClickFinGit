<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("invId");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
</style>
<body>
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

		rs1 = stmt.executeQuery("SELECT id, name, period, money, day, user_id FROM invest WHERE id = '"+ id  +"'");
		%><table width=700px; style="border-collapse:collapse; border: 1px gray solid;">
		<tr>
		<td>���ڹ�ȣ</td>
		<td>��ǰ�̸�</td>
		<td>���ڱⰣ</td>
		<td>���ڱݾ�</td>
		<td>���ڼ��ͷ�</td>
		<td>����������</td>
	    </tr>
		<%
		rs1.next();


		String invId = rs1.getString("id");
		String name = rs1.getString("name");
		String period = rs1.getString("period");
		String money = rs1.getString("money");
		String day = rs1.getString("day");
		

		rs2 = stmt.executeQuery("select rate from invest_product where name ='"+ name +"'");
		rs2.next();
		String rate = rs2.getString("rate");
		
		out.println("<td>" + invId + "</td>");
		out.println("<td>" + name + "</td>");
		out.println("<td>" + period + "</td>");
		out.println("<td>" + money + "</td>");
		out.println("<td>" + rate + "</td>");
		out.println("<td>" + day + "</td>");
		out.println("</tr>");

	}
	catch(Exception e){
		e.printStackTrace();
		out.println("�������");
	}

%>
</body>
</html>