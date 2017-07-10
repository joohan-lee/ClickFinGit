<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
    
<% String userId = "";
   userId = (String)session.getAttribute("userId");
   if(userId == null || userId.equals(""))
   {
      %><script>alert("잘못된 로그인");
      location.href("login.html");
      </script><%
      
   }%>
    
    <%String searchStr = request.getParameter("searchStr");//검색하려는 문자열
       %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객관리 - 고객별 개인정보</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
td,tr,th{
   border: 1px gray solid;
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
<!-- customer's personal Info View -->
   <div id="content" style="width: 800px;">
      <h2>고객 개인정보</h2>
      <form action="consultCtmInfoView.jsp">
      
      <select id="searchCond" style="width:100px;">
         <option value="이름">이름</option>
      </select>
      
      <!-- 선택된 select메뉴 -->
      <script type="text/javascript">
    function CheckSelect(){
        var ctrlSelect = document.getElementById("searchCond");
        if( ctrlSelect.selectedIndex == 0){
            //alert("관심사항을 선택하시오.");
            ctrlSelect.focus();
        }else{
            //window.alert("당신의 관심사항 : " + ctrlSelect.value );
        }
    }
  </script>
      
      
      <input type="text" name="searchStr" style="width:300px">
      <input type="submit" value="검색" onclick="CheckSelect();")>
      
      </form>
   <%
   //if(!"".equals(searchStr))//검색하려는 문자열을 DB에서 검색하고 존재하면 출력
   //{
   Connection conn = null;                                        // null로 초기화 한다.
   ResultSet rs1 = null;
   ResultSet rs2 = null;
   Statement stmt1 = null;
   Statement stmt2 = null;
   DataSource ds;
   try{
      Context init = new InitialContext();
      ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
      conn = ds.getConnection();
      stmt1 = conn.createStatement();
      stmt2 = conn.createStatement();
      String sql = "select * from users where name='" + searchStr + "'and id in( select id from customer where consul_id ='"+userId+"')";
      rs1 = stmt1.executeQuery(sql);
while(rs1.next()){
   String name = rs1.getString("name");
   String rrn = rs1.getString("rrn");
   String phone = rs1.getString("phone");
   String address = rs1.getString("address");
   rs2 = stmt2.executeQuery("select marry, child, anniversary from customer where consul_id = '" +userId +"'");
   rs2.next();
   String marry = rs2.getString("marry");
   String child = rs2.getString("child");
   String anniversary = rs2.getString("anniversary");
   %>
   		<%
session.setAttribute("cusName", name); 
session.setAttribute("cusRrn",rrn );
session.setAttribute("cusPhone", phone);
session.setAttribute("cusAddress", address);
session.setAttribute("cusMarry", marry); 
session.setAttribute("cusChild",child );
session.setAttribute("cusAnniversary", anniversary);
%>
      <br>
      <table width="70%"style="border-collapse:collapse;
            border: 1px solid gray;">
         <tr>
            <th>이름</th>
            <td><%= name%></td>
         </tr>
         <tr>
            <th>주민번호</th>
            <td><%= rrn%>-</td>
         </tr>
         <tr>
            <th>연락처</th>
            <td><%= phone%></td>
         </tr>
         <tr>
            <th>주소</th>
            <td><%= address%></td>
         </tr>
         <tr>
            <th>결혼유뮤</th>
            <td><%= marry %></td>
         </tr>
         <tr>
            <th>자녀</th>
            <td>
               <%= child %>
            </td>
         </tr>
         <tr>
            <th>기념일</th>
            <td>
            	<%= anniversary %>
            </td>
         </tr>
      </table>
     <%}
   } catch(Exception e){
      e.printStackTrace();
      out.println("연결실패");
   }
    %>
<!-- Button for modifying Customers' personal Info -->
   <div width="70%">
      <br>
      <form action="consultCtmInfoModify.jsp" method="post">
      <%session.setAttribute("searchStr",searchStr);
      //response.sendRedirect("consultCtmInfoModify.jsp");%>
      <input type="button" value="검색한 고객정보수정" style="float:right;"
         onclick="location.href='consultCtmInfoModify.jsp'")>
      </form>
   </div>
   
   </div>
</div>


</body>
</html>