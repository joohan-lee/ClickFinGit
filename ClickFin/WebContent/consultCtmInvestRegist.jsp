<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
String searchStr = "customer";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 투자상품 등록</title>
<style>
tr, td, th{
   border:1px gray solid;
}
th{
   background:#E9E6E6;
}
td input{
   width:100%;
   height:100%;
   border:0;
}
</style>
</head>
<body>

<div id="content" style="width:400px">
   
   <h2><%=searchStr%>님의 투자 상품 등록</h2>
   
   <form action="consultCtmInvestRegistOK.jsp">
   <table>
      <tr>
         <th>상품명</th>
         <td><input type="text" name="name"></td>
      </tr>
      <tr>
         <th>투자기간</th>
         <td><input type="text" name="period"></td>
      </tr>
      <tr>
         <th>투자금액</th>
         <td><input type="text" name="money"></td>
      </tr>
      <tr>
         <th>배당금지급일</th>
         <td><input type="text" name="day"></td>
      </tr>
      <tr>
         <th>총지급배당금</th>
         <td><input type="text" name=""></td>
      </tr>
      <tr>
         <th>기지급배당금</th>
         <td><input type="text" name=""></td>
      </tr>
      <tr>
         <th>추가지급배당금</th>
         <td><input type="text" name=""></td>
      </tr>
      <tr>
         <th>증서 스캔본 업로드</th>
         <td><input type="file" name="//파일 받아올 jsp에서 이용할 name"></td>
      </tr>
   </table>
   <input type="submit" value="등록"
      style="float:right;margin:10px">
   </form>
</div>
</body>
</html>