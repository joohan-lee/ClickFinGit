<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String identity = request.getParameter("userId");
String password = request.getParameter("userPw");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
<% 
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
ResultSet rs = null;
Statement stmt = null;
DataSource ds;
try{
	Context init = new InitialContext();
	ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	conn = ds.getConnection();
	String sql = "select * from users";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);


while(rs.next()){
	String id1 = rs.getString("id");
	String pw1 = rs.getString("pw");
	String role = rs.getString("role");
	
	if(identity.equals(id1)&& password.equals(pw1)){
		if(role.equals("admin")){			
				response.sendRedirect("adminView.jsp");
				session.setAttribute("userId", identity); 
		        session.setAttribute("userPw", password);
		        session.setAttribute("userRole", role);
				 }
		else if(role.equals("consultant")){
			response.sendRedirect("consultantView.jsp");
			session.setAttribute("userId", identity); 
	        session.setAttribute("userPw", password);
	        session.setAttribute("userRole", role);
				 }
		else if(role.equals("customer")){
			response.sendRedirect("customerView.jsp");
			session.setAttribute("userId", identity); 
	        session.setAttribute("userPw", password);
	        session.setAttribute("userRole", role);
			 }
	}
	else if(identity.equals("")||password.equals("")) {%>
	 <script>
	 alert('���̵� Ȥ�� ��й�ȣ�� �Է����ּ���.');
	 history.go(-1);
	</script>
	<%
	}
	else { %>
	<script>
	alert('���̵� Ȥ�� ��й�ȣ�� Ʋ�Ƚ��ϴ�.');
	history.go(-1);
	</script>
	 <%} 
}
rs.close();
stmt.close();
conn.close();
}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
e.printStackTrace();
out.println("�������");
}
%>
</head>
<body>
</body>
</html>