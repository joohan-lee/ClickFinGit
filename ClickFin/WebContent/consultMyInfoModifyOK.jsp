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
Connection conn = null;                                        // null로 초기화 한다.
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
	alert('항목을 모두 채워주세요.');
	history.go(-1);
	</script>
	<%
	}

	String sql = "update users set name = '" +name +"' ,phone= '" +phone +"' ,address= '" +address+ "' ,email='"+email+"' where id = '"+id+"'";
	int result = stmt.executeUpdate(sql);
	
	if( result > 0 )
	{%>
		<script>
		alert('수정되었습니다.');
	      location.href='consultMyInfoView.jsp';
		</script>
	<% }
	else
	{
		%>
		<script>
		alert('수정에 실패하였습니다.');
		history.go(-1);
		</script>
	<%
	}

}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
	%>
	<script>
	alert('다시 입력해 주세요.');
	history.go(-1);
	</script>
	 <%
}
%>

</body>
</html>