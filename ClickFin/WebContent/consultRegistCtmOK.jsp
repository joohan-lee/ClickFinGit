<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String id = (String)session.getAttribute("userId");
String rrnFirst = request.getParameter("cusRrnFirst");
String rrnSecond = request.getParameter("cusRrnSecond");
String phone = request.getParameter("cusPhone");
String address = request.getParameter("cusAddress");
String marry = request.getParameter("cusMarry");
String child = request.getParameter("cusChild");
String anniversary = request.getParameter("cusAnniversary");
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
	if(id.equals("")||rrnFirst.equals("")||rrnSecond.equals("")||phone.equals("")||address.equals("")||marry.equals("")||child.equals("")||anniversary.equals("")) {%>
	<script>
	alert('�׸��� ��� ä���ּ���.');
	history.go(-1);
	</script>
	<%
	}

	String sql1 = "insert into users values (" + '"
	int result1 = stmt.executeUpdate(sql1);
	
	String sql2 = "update customer set marry = '" +marry +"' ,child= '" +child +"' ,anniversary= '" +anniversary+ "' where consul_id = '"+id+"'";
	int result2 = stmt.executeUpdate(sql2);

	if( result1 > 0 && result2>0 )
	{%>
		<script>
		alert('�����Ǿ����ϴ�.');
		location.href("./consultCtmInfoView.jsp");
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