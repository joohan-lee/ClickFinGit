<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
Connection conn = null;
ResultSet rs = null;
Statement stmt = null;
DataSource ds;
try {
Context init = new InitialContext();
ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
conn = ds.getConnection();
String sql = "select * from users";
stmt = conn.createStatement();
rs = stmt.executeQuery(sql);
out.println("<table border='1' width='300'>");
while(rs.next()){
	String id = rs.getString("id");
	String name = rs.getString("name");
	out.println(id + " : " + name + "<BR>");
}
//out.println("</table>");
rs.close();
out.println("연결되었습니다!!");
}
catch(Exception e) {
//out.println("연결실패!!");
out.println("<h1>데이터 가져오기에 실패하였습니다.</h1>");
e.printStackTrace();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Tomcat DBCP Test</title>
</head>
<body>
</body>
</html>
