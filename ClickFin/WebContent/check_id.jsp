<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String identity = (String)request.getParameter("get_id");
%>

<html>

<head>
<script>
	function clk_btn(val){
		var en;
		if(val == 1){
			en = "<%=identity%>";
		}
		else if(val == 0){
			en = "cancel";
		}
		else{
			en = "disable";
		}

		window.returnValue = en;
		window.close();
	}

</script>

<title>id �ߺ� �˻�</title>
</head>
<body>
<% 
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	boolean chk_id = true;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			String id1 = rs.getString("id");
			if(id1.equals(identity))
			{
				chk_id = false;
				break;
			}

		}
		String enableID = "enable";
		if(chk_id == true){
			enableID = "enable";
			%><%=identity %> - ��� ����.<br> ����Ͻðڽ��ϱ�? <br><br>
			<form action = "aRegitConsultant.jsp" method = "post">
			<input type = "button" value = "��" onclick = "clk_btn(1)">

			
			</form>
			
			<input type = "button" value = "�ƴϿ�" onclick = "clk_btn(0)">
			<%
		}
		else{
			%><%=identity %> - �� ����� �� ���� ID �Դϴ�. <br><br>
			<input type = "button" value = "��" onclick = "clk_btn(2)">
			<%
			
		}
		
		session.setAttribute("enableID",enableID);
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		e.printStackTrace();
		out.println("�������");
	}
%>

</body>
</html>

