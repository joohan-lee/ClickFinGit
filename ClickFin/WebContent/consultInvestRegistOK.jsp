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
name = new String(name.getBytes("8859_1"),"UTF-8"); // getBytes("8859_1") 8859-1타입으로 쪼개서
rate = new String(rate.getBytes("8859_1"),"UTF-8"); // getBytes("8859_1") 8859-1타입으로 쪼개서
}//utf-8로 디코딩

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
   
   sql = "select name from invest_product where name = '"+name+"'";
   rs = stmt.executeQuery(sql);
   while(rs.next()) {
      %><script>
         alert("이미 존재하는 상품입니다.");
         history.go(-1);
      </script><%
   }

   sql = "insert into invest_product values('"+ name +"', '"+ rate +"')";
   stmt.executeUpdate(sql);
   
   rs.close();
   stmt.close();
   conn.close();
}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
   e.printStackTrace();
   out.println("연결실패");
}%><script>
	alert('등록완료');
	location.href='consultProductRegistedView.jsp';
	</script>

</head>
<body>
</body>
</html>