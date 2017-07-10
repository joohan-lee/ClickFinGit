<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%  String userId = "";
   userId = (String)session.getAttribute("userId");
   if(userId == null || userId.equals(""))
   {
      %><script>alert("잘못된 로그인");
      location.href("login.html");
      </script><%
      
   }%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 관리 - 고객 전체 현황</title>
<link rel="stylesheet" href="navbar.css">


</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>님 환영합니다.<br>
    <a href ="logout.jsp" >로그아웃</a></div>
<!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;float:left;">
    <ul id="navi">
        <li class="group">
            <div class="title">컨설턴트</div>
            <ul class="sub">
                <li><a href="consultMyInfoView.jsp">개인정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">고객관리</div>
            <ul class="sub">
                <li><a href="consultShowAllCustom.jsp">고객 전체 현황</a></li>
                <li><a href="consultCtmInfoView.jsp">고객별 개인정보</a></li>
                <li><a href="consultCtmProductAll.jsp">고객별 가입상품현황</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">상품별 현황</div>
            <ul class="sub">
                <li><a href="consultAllInvestView.jsp">투자</a></li>                
                <li><a href="consultAllInsuranceView.jsp">보험</a></li>
                <li><a href="consultAllFundView.jsp">펀드</a></li>
                <li><a href="consultAllSavingView.jsp">적금 예금</a></li>
            </ul>
        </li>          
    </ul>
    </div>
    <div id="content" style="width: 800px">
       <h2>고객관리</h2>
       <form action="consultShowAllCustom.jsp">
          <input type="text" name="customName">
          <input type="button" value="검색" onclick="">
       </form>

<!-- 순번, 고객명, 호칭, 회사명, 연락처, 펀드건, 보험건 -->

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
      Statement stmt1 = conn.createStatement();
      Statement stmt2 = conn.createStatement();
      %>
      <table width="70%"
       style="border-collapse:collapse;border:1px gray solid;
       margin-top: 20px;">
       <thead>
         <th>순번</th>
         <th>고객명</th>
         <th>호칭</th>
         <th>회사명</th>
         <th>연락처</th>
         <th>펀드건</th>
         <th>보험건</th>
       </thead>
      <tbody id="customTbody">
         <%
         rs1 = stmt1.executeQuery("SELECT id, name, phone FROM users WHERE id IN ("+
                  "SELECT id FROM customer WHERE consul_id = '"+ userId  +"')");
         int i=0;
         while(rs1.next()) {
            i++;
            String cusId = rs1.getString("id");
            String name = rs1.getString("name");
            String phone = rs1.getString("phone");
            rs2 = stmt2.executeQuery("SELECT nick, company FROM customer WHERE id = '"+cusId+"'");
            rs2.next();
            String nick = rs2.getString("nick");
            String company = rs2.getString("company");

            out.println("<tr>");
            out.println("<td>" + i + "</td>");
            out.println("<td>" + name + "</td>");
            out.println("<td>" + nick + "</td>");
            out.println("<td>" + company + "</td>");
            out.println("<td>" + phone + "</td>");
            out.println("<td>" + "0" + "</td>");
            out.println("<td>" + "0" + "</td>");
            out.println("</tr>");
            
         }
         %>
      </tbody>

      
       </table>
      
      <%
   } catch(Exception e){
      e.printStackTrace();
      out.println("연결실패");
   }
    %>
    
    <input type="button" value="고객 상품등록" style="margin:10px;float:right"
    onclick="location.href='consultRegistWhichProduct.jsp'">
    <input type="button" value="고객 등록하기" style="margin:10px;float:right"
   	onclick="location.href='consultRegistCtm.jsp'")>
    
    </div>
</div>


</body>
</html>