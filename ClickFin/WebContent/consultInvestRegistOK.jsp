<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%>
<% //request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//String user_id = (String)session.getAttribute("searchStr");
//user_id = "customer";
//out.print(user_id);
String name = request.getParameter("name");
String rate = request.getParameter("rate");
if(name != null && rate!=null){
name = new String(name.getBytes("8859_1"),"UTF-8"); // getBytes("8859_1") 8859-1Ÿ������ �ɰ���
rate = new String(rate.getBytes("8859_1"),"UTF-8"); // getBytes("8859_1") 8859-1Ÿ������ �ɰ���
}//utf-8�� ���ڵ�

if(name.equals("")||rate.equals("")) {
   %><script>
      history.go(-1);
   </script><%
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
   String sql = null;
   
   sql = "select name from invest_product where name = '"+name+"'";
   rs = stmt.executeQuery(sql);
   while(rs.next()) {
      %><script>
         alert("�̹� �����ϴ� ��ǰ�Դϴ�.");
         history.go(-1);
      </script><%
   }

   sql = "insert into invest_product values('"+ name +"', '"+ rate +"')";
   stmt.executeUpdate(sql);
   
   rs.close();
   stmt.close();
   conn.close();
}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
   e.printStackTrace();
   out.println("�������");
}%><script>
	alert('��ϿϷ�');
	location.href='consultProductRegistedView.jsp';
	</script>

</head>
<body>
</body>
</html>