<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String del_id = null;
	del_id = request.getParameter("id");
	String bp = request.getParameter("bp");
%>

<html>

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

try{
	Context init = new InitialContext();
	ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	conn = ds.getConnection();
	String sql = "delete from users where id ='"+del_id+"'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if(del_id != null){
		rs = stmt.executeQuery(sql);
		%><script>alert('삭제되었습니다!.'); </script><%
		if(bp.equals("all")){
			%><script>location.href = "aInfoCustom.jsp"</script><%
		}
		else{
			%><script>location.href = "aInfoCustomerSearch.jsp"</script><%
		}
		
	}
	else{
		%><script>alert('잘못된 접근입니다.');</script><%	
	}
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