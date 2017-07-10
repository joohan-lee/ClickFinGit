<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
   String id = "";
   id = (String)session.getAttribute("userId");
%>
<div style = "text-align:right" ><%=id %>님 환영합니다.<br>
<a href ="logout.jsp">로그아웃</a>
</div>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<nav id ="topmenu">

   <ul>
   <li><img src="HSR logo.png"></li>
      
     <li class="topmenuLi">
       <a class="menulink" href="#">개인정보</a>
         <ul class="submenu">
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfo.jsp" class="submenulink">내 정보</a></li>
         </ul>
      </li>
         <li>|</li>
   <li class="topmenuLi">
      <a class="menulink" href="#">상품별 현황 보기</a>
         <ul class="submenu">
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyProductAll.jsp" class="submenulink">가입상품 전체 현황</a></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">상품별 상세 현황</a></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink" >타상품 상세 현황</a></li>
            
         </ul>
      </li>
         <li>|</li>
   </ul> 

</nav>
<div id="content" >
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%

   Connection conn = null;                                        // null로 초기화 한다.
   ResultSet rs1 = null;   //사용자의 id, 이름, 생년월일, 번호, 주소, 이메일주소를 가져오기 위한 resultset
   ResultSet rs2 = null;   //컨설턴트의 이름, 번호, 이메일주소를 가져오기 위한 resultset
   DataSource ds;
   try{
      Context init = new InitialContext();
      ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
      conn = ds.getConnection();
      Statement stmt = conn.createStatement();
      Statement stmt2 = conn.createStatement();
      
      //투자상품--------------------------------------
      
      rs1 = stmt.executeQuery("SELECT name, rate FROM invest_product");
      %><table>
       <thead>
         <th>상품이름</th>
         <th>투자수익률</th>
       </thead>
      <tbody id="customTbody">
      <%
      while(rs1.next()){
         String name = rs1.getString("name");
         String rate = rs1.getString("rate");
         out.println("<td>" + name + "</td>");
         out.println("<td>" + rate + "</td>");
         out.println("</tr>");
      }
      %></tbody></table><br><%
      
      //보험상품------------------------------------------------------
      
      rs1 = stmt.executeQuery("SELECT name, company, fee, period, ensure FROM insurance_product");
      %><table>
      <thead>
         <th>상품이름</th>
         <th>회사</th>
         <th>보험료</th>
         <th>보장기간</th>
         <th>보장내역</th>
      </thead>
      <tbody id="customTbody">
      <%
      while(rs1.next()){
         String name = rs1.getString("name");
         String company = rs1.getString("company");
         String fee = rs1.getString("fee");
         String period = rs1.getString("period");
         String ensure = rs1.getString("ensure");      
         out.println("<tr>");
         out.println("<td>" + name + "</td>");
         out.println("<td>" + company + "</td>");
         out.println("<td>" + fee + "</td>");
         out.println("<td>" + period + "</td>");
         out.println("<td>" + ensure + "</td>");
         out.println("</tr>");
      }
      %></tbody></table><br><%
      
      //펀드상품---------------------------------------------------------------------
      
      rs1 = stmt.executeQuery("SELECT name, company, type FROM fund_product");
      %><table>
       <thead>
         <th>상품이름</th>
         <th>회사</th>
         <th>유형</th>
      </thead>
      <tbody id="customTbody">
      <%
      while(rs1.next()){
         String name = rs1.getString("name");
         String company = rs1.getString("company");
         String type = rs1.getString("type");
         out.println("<tr>");
         out.println("<td>" + name + "</td>");
         out.println("<td>" + company + "</td>");
         out.println("<td>" + type + "</td>");
         out.println("</tr>");
      }
      %></tbody></table><br><%

      //저축상품(적금/예금)---------------------------------------------------------------------
      
      rs1 = stmt.executeQuery("SELECT name, company FROM saving_product");
      %><table>
       <thead>
         <th>상품이름</th>
         <th>회사</th>
      </thead>
      <tbody id="customTbody">
      <%
      while(rs1.next()){
         String name = rs1.getString("name");
         String company = rs1.getString("company");
         out.println("<tr>");
         out.println("<td>" + name + "</td>");
         out.println("<td>" + company + "</td>");
         out.println("</tr>");
      }
      %></tbody></table><br><%
      
   }
   catch(Exception e){
      e.printStackTrace();
      out.println("연결실패");
   }
%>
</div>
</body>
</html>