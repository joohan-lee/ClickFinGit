<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String id = (String)session.getAttribute("userId");
String name = request.getParameter("consultMyName");
String phone = request.getParameter("consultMyPhone");
String address = request.getParameter("consultMyAddress");
String email = request.getParameter("consultMyEmail");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>modify</title>
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
	stmt = conn.createStatement();
	if(name.equals("")||phone.equals("")||address.equals("")||email.equals("")) {%>
	<script>
	alert('�׸��� ��� ä���ּ���.');
	history.go(-1);
	</script>
	<%
	}

	String sql = "update users set name = '" +name +"' ,phone= '" +phone +"' ,address= '" +address+ "' ,email='"+email+"' where id = '"+id+"'";
	int result = stmt.executeUpdate(sql);
	System.out.println(result);

	if( result > 0 )
	{%>
		<script>
		alert('�����Ǿ����ϴ�.');
		location.href("./consultMyInfoView.jsp");
		</script>
	<% }
	else
	{
		%>
		<script>
		alert('������ �����Ͽ����ϴ�.');
		history.go(-1);
		</script>
	<%
	}

}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
	%>
	<script>
	alert('�ٽ� �Է��� �ּ���.');
	history.go(-1);
	</script>
	 <%
}
%>

</body>
</html>