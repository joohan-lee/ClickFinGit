<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String get_id = null;
	get_id = request.getParameter("id");
	String bp = request.getParameter("back");
%>

<html>
<script>
	function move_backpage(){
		var back_location = "<%=bp%>";
		if(back_location == "all"){
			location.href = "aInfoConsultant.jsp?id=<%=get_id%>";
		}
		else{
			location.href = "aInfoConsultantSearch.jsp?id=<%=get_id%>";
		}
	}
</script>
<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}

</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
<body>
<% 
Connection conn = null;                                        // null로 초기화 한다.
ResultSet rs = null;
Statement stmt = null;
DataSource ds;
String d_id = null;
String d_rrn = null;
String d_email = null;
String d_num = null;
String d_name = null;
String d_addr = null;

try{
	Context init = new InitialContext();
	ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	conn = ds.getConnection();
	String sql = "select * from users where id ='"+get_id+"'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if(get_id == null){
		
	}
	else{
		
		
		while(rs.next()){
			d_id = rs.getString("id");
			d_name = rs.getString("name");
			d_rrn = rs.getString("rrn");
			d_num = rs.getString("phone");
			d_email = rs.getString("email");
			d_addr = rs.getString("address");
		}%>
		<table width="700" border="1"
				style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;">
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>아이디</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=d_id %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>이름</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=d_name %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>주민등록번호</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=d_rrn %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>이메일</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=d_email %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>전화번호</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=d_num %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>주소</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=d_addr %></font>
						</div></td>	
				</tr>
				
		</table>
		
		<br>
		
		<div style = "text-align:center">
		<input type = "button" value = "뒤로가기" onclick = "move_backpage()">&nbsp;
		<input type = "button" value = "수정" onclick = "location.href = 'aConsultantModify.jsp?id=<%=d_id%>&bp=<%=bp%>'">&nbsp;
		<input type = "button" value = "삭제" onclick = "location.href = 'aConsultantDelete.jsp?id=<%=d_id%>&bp=<%=bp%>'"></div>
	<%}
	rs.close();
	stmt.close();
	conn.close();
	}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
		out.println("연결실패");
	}
	%>
	
</body>
</head>
<body>
</body>
</html>