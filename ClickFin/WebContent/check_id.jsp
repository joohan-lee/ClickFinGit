<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String identity = request.getParameter("input_id");
%>

<html>

<head>

<title>id �ߺ� �˻�</title>
</head>
<body>
<% 
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	String idcheck = "t";
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			String id1 = rs.getString("id");
			if(id1.equals(identity))
			{
				
				idcheck = "f";
				break;
			}
			else
			{
				idcheck ="t";
			}
		}
		session.setAttribute("chkID", idcheck); 
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		e.printStackTrace();
		out.println("�������");
	}
%>

</body>
</html>

