<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String id = (String)session.getAttribute("userId");
String searchStr = (String)session.getAttribute("searchStr");
String name = request.getParameter("cusMyName");
String rrn = request.getParameter("cusMyRrn");
String phone = request.getParameter("cusMyPhone");
String address = request.getParameter("cusMyAddress");
String marry = request.getParameter("cusMyMarry");
String child = request.getParameter("cusMyChild");
String anniversary = request.getParameter("cusMyAnniversary");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
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
	if(name.equals("")||phone.equals("")||address.equals("")||rrn.equals("")||marry.equals("")||anniversary.equals("")||child.equals("")) {%>
	<script>
	alert('�׸��� ��� ä���ּ���.');
	history.go(-1);
	</script>
	<%
	}

	String sql1 = "update users set name = '" +name +"' ,phone= '" +phone +"' ,address= '" +address+ "' ,rrn='"+rrn+"' where name = '"+searchStr+"'";
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