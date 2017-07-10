<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String user_id = (String)session.getAttribute("searchStr");
user_id = "customer";
out.print(user_id);
String name = request.getParameter("name");
out.println(name);
String period = request.getParameter("period");
String money = request.getParameter("money");
String day = request.getParameter("day");
out.println(period);
out.println(money);
out.println(day);


if(name.equals("")||period.equals("")||money.equals("")||day.equals("")) {
   %><script>
      history.go(-1);
   </script><%
}

%>
<%=name%>
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
   //"select count(id) from invest"
   String sql = null;
   
   sql = "select count(id) from invest";
   rs = stmt.executeQuery(sql);
   rs.next();
   int num = rs.getInt("count(id)");
   num++;
   String inv_id = null;
   if(num < 10) inv_id = "inv0" + num;
   else inv_id = "inv" + num;
   
   out.println(inv_id);
   out.println(name);
   out.println(user_id);
   sql = "insert into invest values('"+ inv_id +"', '"+ name +"', '"+ period +"', '"+ money +"', '"+ day +"', '"+ user_id +"')";
   //String sql = "select * from users";
   stmt.executeUpdate(sql);
   out.print("c");
   
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