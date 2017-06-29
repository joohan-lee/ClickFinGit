<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<%
	String DB_URL = "jdbc:oracle:thin:@SaucK:1521:orcl";
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(DB_URL, "system", "sk1516");
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM users");
		while (rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			out.println(id + " : " + name + "<BR>");
		}

	rs.close();
	stmt.close();
	con.close();
	} catch (Exception e){
		out.println("ERROR");
		e.printStackTrace();
	}
%>

=======
Hello World!<br>
kiwooong zzangzzangman
eunbyul
>>>>>>> refs/remotes/origin/sukwoo
</body>
</html>