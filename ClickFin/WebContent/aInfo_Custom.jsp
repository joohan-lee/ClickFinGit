<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 - 관리자 접속</title>
</head>
<body>
	<div style="text-align: center">
		<font size="15">고객 현황</font>
	</div>

	<%
	Connection conn = null;                                        // null로 초기화 한다.
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
   	
   	//ResultSet get_type = st.executeQuery(get_type_Query);
   		%>

<body>
	<table width="700" border="1"margin:auto; text-align:center;">
		<tr>
			<td width="100"><div style="text-align: center">
					<font size=3>이름</font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3>ID</font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3>담당 컨설턴트</font>
				</div></td>
		</tr>
		<%
   		while(rs.next())
   	   	{
   			String id1 = rs.getString("id");
   			String name = rs.getString("name");
   			String role = rs.getString("role");
   	   		if(role.equals("customer")){
   	   		%>
		<tr>

			<td width="100"><div style="text-align: center"><%= name %></div></td>
			<td width="100"><div style="text-align: center"><%= id1 %></div></td>
			<td width="100"><div style="text-align: cente"></div>
		</tr>
		<%}
   	   	}
   	
   }catch(Exception e)
   {
   	out.println("ERROR");
   	e.printStackTrace();
   }
%>
	</table>
</body>
</html>