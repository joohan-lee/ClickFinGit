<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>


<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
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
		<font size="6em">컨설턴트 현황</font>
	</div>

	<%
	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	
	String id1 = null;
	String name = null;
	String rrn = null;
	String show_rrn = null;
	String num = null;
		
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users where role = 'consultant'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
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
					<font size=3>주민등록번호</font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3>   </font>
				</div></td>
		</tr>
		<%
   		while(rs.next())
   	   	{
   			id1 = rs.getString("id");
   			name = rs.getString("name");
   			rrn = rs.getString("rrn");
   			num = rs.getString("phone");
   			
   			if(rrn.length() != 13){
				show_rrn = " ";
			}
			else{
				show_rrn= rrn.substring(0,6) + "- *******";
			}
   	   		%> 	   		
		<tr>

			<td width="100"><div style="text-align: center"><%= name %></div></td>
			<td width="100"><div style="text-align: center"><%= id1 %></div></td>
			<td width="100"><div style="text-align: cente"><%=show_rrn %></div></td>
			<td width="100"><div style="text-align: cente">
				<a href = "aInfoConsultantDetail.jsp?id=<%=id1%>&back=all">정보보기</a>
			</div></td>
		</tr>
		<%
   	   	}
   	
   }catch(Exception e){
   		out.println("ERROR");
   		e.printStackTrace();
   }
%>
	</table>
</body>
</html>