<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>


<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>


<%
	String user_id = (String)session.getAttribute("userId");
	if(user_id == null || user_id.equals(""))
	{
		%><script>
			alert("잘못된 로그인");
			parent.location.href("login.html");
		</script>
<%
		
	}
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 - 관리자 접속</title>
</head>
<body>

	<div style="text-align: center">
		<font size="15">컨설턴트 현황</font>

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

	<br>
	<br>
	<table width="700" border="1"
		style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;">
		<tr>
			<td width="100"><div style="text-align: center">
					<font size=3>이름</font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3>ID</font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3>관리 고객 수</font>
				</div></td>
		</tr>
		<%
   		while(rs.next())
   	   	{
   			String id1 = rs.getString("id");
   			String name = rs.getString("name");
   			String role = rs.getString("role");
   	   		if(role.equals("consultant")){
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