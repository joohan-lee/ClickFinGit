<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userId");%>
	
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

	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs1 = null;	//사용자의 id, 이름, 생년월일, 번호, 주소, 이메일주소를 가져오기 위한 resultset
	ResultSet rs2 = null;	//컨설턴트의 이름, 번호, 이메일주소를 가져오기 위한 resultset
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		//id varchar(15), pw varchar(15), name varchar(15), role varchar(15), rrn varchar(13)
		//query = "ALTER TABLE users ADD (phone varchar(13))";
		//query = "ALTER TABLE users ADD (address varchar(50), email varchar(30))";
		id = "customer";
		
		rs1 = stmt.executeQuery("SELECT id, name, period, money, day FROM invest WHERE user_id = '"+ id  +"'");
		%><table width=700px; style="border-collapse:collapse; border: 1px gray solid;">
		<tr>
		<td>투자번호</td>
		<td>상품이름</td>
		<td>투자기간</td>
		<td>투자금액</td>
		<td>배당금지급일</td>
	    </tr>
		<%
		while(rs1.next()){
			String getID = rs1.getString("id");
			if(id.equals(getID)) {
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String money = rs1.getString("money");
				String day = rs1.getString("day");
				
				
				
				
				out.println("<tr>");
				out.println("<td>" + getID + "</td>");
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("</tr>");
			}
			
			
		}
		out.print(id);
		rs1 = stmt.executeQuery("SELECT id, name, period, user_id FROM insurance WHERE user_id = '"+ id  +"'");
		%></table><br><table width=700px; style="border-collapse:collapse; border: 1px gray solid;">
		<tr>
		<td>보험번호</td>
		<td>상품이름</td>
		<td>납입기간</td>
		<td>회사</td>
		<td>보험료</td>
		<td>보장기간</td>
		<td>보장내역</td>
		
	    </tr>
		<%
		while(rs1.next()){
			
			String getID = rs1.getString("user_id");
			if(id.equals(getID)) {
				String insId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");

				rs2 = stmt.executeQuery("select company, fee, period, ensure from insurance_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String fee = rs2.getString("fee");
				String insPeriod = rs2.getString("period");
				String ensure = rs2.getString("ensure");
				
				out.println("<tr>");
				%><td><a href="customerMyInsurance.jsp" target ="body"><%
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
	}
	catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
		out.println("연결실패");
	}
%>
</body>
</html>