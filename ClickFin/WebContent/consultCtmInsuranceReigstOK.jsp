<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String user_id = (String)session.getAttribute("searchStr");
String name = request.getParameter("name");
String period = request.getParameter("period");

if(name.equals("")||period.equals("")) {
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
Connection conn = null;                                        // null로 초기화 한다.
ResultSet rs = null;
Statement stmt = null;
DataSource ds;
try{
   Context init = new InitialContext();
   ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
   conn = ds.getConnection();
   stmt = conn.createStatement();
   String sql = null;
   
   /////////////////////////////////////////////ID어떻게 정할지
   sql = "select count(id) from insurance";
   rs = stmt.executeQuery(sql);
   rs.next();
   int num = rs.getInt("count(id)");
   num++;
   String ins_id = null;
   if(num < 10) ins_id = "ins0" + num;
   else ins_id = "inv" + num;
   /////////////////////////////////////////////
   
   sql = "insert into insurance values('"+ ins_id +"', '"+ period +"', '"+ name +"', '"+ user_id +"')";
   stmt.executeUpdate(sql);
   
   rs.close();
   stmt.close();
   conn.close();
}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
   e.printStackTrace();
   out.println("연결실패");
}
%>
</head>
<body>
</body>
</html>