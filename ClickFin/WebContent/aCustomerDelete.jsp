<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String del_id = null;
	del_id = request.getParameter("id");
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
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
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
		%><script>alert('�����Ǿ����ϴ�!.'); location.href = "aInfoCustomerSearch.jsp"</script><%	
		
	}
	else{
		%><script>alert('�߸��� �����Դϴ�.');</script><%	
	}
	rs.close();
	stmt.close();
	conn.close();
	}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		e.printStackTrace();
		out.println("�������");
	}
	%>
	
</body>
</head>
<body>
</body>
</html>