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
		out.print(id);
		rs1 = stmt.executeQuery("SELECT id, name, rrn, phone, address, email FROM users WHERE ID = '"+ id  +"'");
	}
	catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
		out.println("연결실패");
	}
	
	while(rs1.next()){
		String getID = rs1.getString("id");
		if(id.equals(getID)) {
			String name = rs1.getString("name");
			String birth = rs1.getString("rrn").substring(0, 5);	//rrn 앞에 6자리
			String phone = rs1.getString("phone");
			String address = rs1.getString("address");
			String emain = rs1.getString("email");
			
			out.println("<tr>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + birth + "</td>");
			out.println("<td>" + phone + "</td>");
			out.println("<td>" + address + "</td>");
			out.println("</tr>");
		}
		
		
	}
%>
</body>
</html>