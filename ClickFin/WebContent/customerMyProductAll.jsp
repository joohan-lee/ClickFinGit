<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userId");%>
<div style = "text-align:right" ><%=id %>�� ȯ���մϴ�.<br>
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
<div id="content" >
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
		Statement stmt2 = conn.createStatement();
		//id varchar(15), pw varchar(15), name varchar(15), role varchar(15), rrn varchar(13)
		//query = "ALTER TABLE users ADD (phone varchar(13))";
		//query = "ALTER TABLE users ADD (address varchar(50), email varchar(30))";
		id = "customer";
		
		//����--------------------------------------
		
		rs1 = stmt.executeQuery("SELECT id, name, period, money, day, user_id FROM invest WHERE user_id = '"+ id  +"'");
		%><table>
    	<thead>
			<th>���ڹ�ȣ</th>
			<th>��ǰ�̸�</th>
			<th>���ڱⰣ</th>
			<th>���ڱݾ�</th>
			<th>���ڼ��ͷ�</th>
			<th>����������</th>
    	</thead>
		<tbody id="customTbody">
		<%
		while(rs1.next()){
			String getID = rs1.getString("user_id");
			if(id.equals(getID)) {
				String invId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String money = rs1.getString("money");
				String day = rs1.getString("day");

				rs2 = stmt.executeQuery("select rate from invest_product where name ='"+ name +"'");
				rs2.next();
				String rate = rs2.getString("rate");
				out.println("<tr>");
				%><td><a href="customerMyInvest.jsp"><%
				//out.println("<td>" + insId + "</td>");
				out.println(invId);
				session.setAttribute("invId", invId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + rate + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("</tr>");
			}
			
			
		}
		%></tbody></table><br><%
		
		//����------------------------------------------------------
		
		rs1 = stmt.executeQuery("SELECT id, name, period, user_id FROM insurance WHERE user_id = '"+ id  +"'");
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
		while(rs1.next()){
			
			String getID = rs1.getString("user_id");
			if(id.equals(getID)) {
				String insId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");

				rs2 = stmt2.executeQuery("select company, fee, period, ensure from insurance_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String fee = rs2.getString("fee");
				String insPeriod = rs2.getString("period");
				String ensure = rs2.getString("ensure");
				
				out.println("<tr>");
				%><td><a href="customerMyInsurance.jsp" ><%
				//out.println("<td>" + insId + "</td>");
				out.println(insId);
				session.setAttribute("insId", insId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("<td>" + fee + "</td>");
				out.println("<td>" + insPeriod + "</td>");
				out.println("<td>" + ensure + "</td>");
				out.println("</tr>");
			}
		}
		%></tbody></table><br><%
		
		//�ݵ�---------------------------------------------------------------------
		
		rs1 = stmt.executeQuery("SELECT id, name, day, month, money, user_id FROM fund WHERE user_id = '"+ id  +"'");
		%><table>
	    <thead>
			<th>�ݵ��ȣ</th>
			<th>��ǰ�̸�</th>
			<th>������</th>
			<th>������</th>
			<th>��ġ�ݾ�</th>
			<th>ȸ��</th>
			<th>����</th>
		</thead>
		<tbody id="customTbody">
		<%
		while(rs1.next()){
			
			String getID = rs1.getString("user_id");
			if(id.equals(getID)) {
				String funId = rs1.getString("id");
				String name = rs1.getString("name");
				String day = rs1.getString("day");
				String month = rs1.getString("month");
				String money = rs1.getString("money");
				
				rs2 = stmt2.executeQuery("select company, type from fund_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String type = rs2.getString("type");
				
				out.println("<tr>");
				%><td><a href="customerMyFund.jsp"><%
				//out.println("<td>" + insId + "</td>");
				out.println(funId);
				session.setAttribute("funId", funId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("<td>" + month + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("<td>" + type + "</td>");
				out.println("</tr>");
			}
		}
		%></tbody></table><br><%

		//����(����/����)---------------------------------------------------------------------
		
		rs1 = stmt.executeQuery("SELECT id, name, period, month, money, user_id FROM saving WHERE user_id = '"+ id  +"'");
		%><table>
	    <thead>
			<th>�����ȣ</th>
			<th>��ǰ�̸�</th>
			<th>���ԱⰣ</th>
			<th>������</th>
			<th>���ݾ�</th>
			<th>ȸ��</th>
		</thead>
		<tbody id="customTbody">
		<%
		while(rs1.next()){
			
			String getID = rs1.getString("user_id");
			if(id.equals(getID)) {
				String savId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String month = rs1.getString("month");
				String money = rs1.getString("money");
				
				rs2 = stmt2.executeQuery("select company from saving_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				
				out.println("<tr>");
				%><td><a href="customerMySaving.jsp"><%
				//out.println("<td>" + insId + "</td>");
				out.println(savId);
				session.setAttribute("savId", savId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + month + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("</tr>");
			}
		}
		%></tbody></table><br><%
		
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("�������");
	}
%>
</div>
</body>
</html>