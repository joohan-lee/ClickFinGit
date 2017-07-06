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
table {
	width:70%; 
	border-collapse:collapse;
	border:1px gray solid;
	margin-top: 20px;
}
</style>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs1 = null;	//사용자의 id, 이름, 생년월일, 번호, 주소, 이메일주소를 가져오기 위한 resultset
	ResultSet rs2 = null;	//컨설턴트의 이름, 번호, 이메일주소를 가져오기 위한 resultset
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();

		rs1 = stmt.executeQuery("SELECT id, name, period, money, day, user_id FROM invest WHERE id = '"+ id  +"'");
		%><table>
    	<thead>
			<th>투자번호</th>
			<th>상품이름</th>
			<th>투자기간</th>
			<th>투자금액</th>
			<th>투자수익률</th>
			<th>배당금지급일</th>
    	</thead>
		<tbody id="customTbody">
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
		%></tbody></table><%
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("연결실패");
	}

%>
</body>
</html>