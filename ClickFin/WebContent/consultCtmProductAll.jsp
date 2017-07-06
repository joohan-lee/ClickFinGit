<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   String userId = "";
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
<title>고객관리 - 고객별 가입상품 현황</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
table{
   border-collapse:collapse;
   border: 1px gray solid;
}
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
#productCtmAll{
   width:600px
}
html{
   height:100%;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>님 환영합니다.<br>
    <a href ="logout.jsp" >로그아웃</a></div>
    
    
    <!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;height:1000px;float:left;">
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
            <div class="title">상품별 전체 현황</div>
            <ul class="sub">
                <li><a href="consultAllInvestView.jsp">투자</a></li>                
                <li><a href="#">보험</a></li>
                <li><a href="#">펀드</a></li>
                <li><a href="#">적금 예금</a></li>
                <li><a href="#">기타</a></li> 
            </ul>
        </li>          
    </ul>
    </div>
    
<!-- 내용 -->
    <div id="content" style="width: 800px">
       <h2>고객관리 - 고객별 가입상품현황</h2>
   <!-- 검색 -->
      <form action="">
      
         <select id="searchCond" style="width:100px;">
            <option value="이름">이름</option>
         </select>
      
         
         <input type="text" name="searchStr" style="width:300px">
         <input type="submit" value="검색" onclick="CheckSelect();")>
      
      </form>
      
      <%String searchStr = "";
      searchStr = request.getParameter("searchStr"); %>
      
      
   <!-- 해당 고객 상품 전체 목록 -->
       <%

	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs1 = null;	//사용자의 id, 이름, 생년월일, 번호, 주소, 이메일주소를 가져오기 위한 resultset
	ResultSet rs2 = null;	//컨설턴트의 이름, 번호, 이메일주소를 가져오기 위한 resultset
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		
      if(!"".equals(searchStr)&&searchStr!=null){
         //DB에 존재하지 않아도 출력되지 않도록 바꾸기 or 존재해야 출력하는 거로 바꾸기%>
       <h3 style="text-align:center"><%=searchStr%> 님의 상품 목록 </h3>
    <!-- 투자테이블 -->   	
    <% 	
		//query = "ALTER TABLE users ADD (phone varchar(13))";
		//query = "ALTER TABLE users ADD (address varchar(50), email varchar(30))";

		
		//투자--------------------------------------
		
		rs1 = stmt.executeQuery("SELECT * FROM invest WHERE user_id = '"+ searchStr  +"'");
		%>
       <h4>- 투자</h4>
       <table id="productCtmAll">
          <tr>
             <th>투자번호</th>
            <th>상품이름</th>
            <th>투자기간</th>
            <th>투자금액</th>
            <th>투자수익률</th>
            <th>배당금지급일</th>
          </tr>
       
        <%
		while(rs1.next()){
			//String getID = rs1.getString("user_id");
			//if(id.equals(getID)) {
				String invId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String money = rs1.getString("money");
				String day = rs1.getString("day");

				rs2 = stmt.executeQuery("select rate from invest_product where name ='"+ name +"'");
				rs2.next();
				String rate = rs2.getString("rate");
				out.println("<tr>");
				%><td><a href="consultCtmInvestView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(invId);
				session.setAttribute("invId", invId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + rate + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("</tr>");
			}
			
			
		//}
		%>
       </table>
          
    <!-- 보험테이블 -->   
   <% rs1 = stmt.executeQuery("SELECT * FROM insurance WHERE user_id = '"+ searchStr  +"'"); %>
    
       <h4>- 보험</h4>
       <table id="productCtmAll">
          <tr>
             <th>보험번호</th>
            <th>상품이름</th>
            <th>납입기간</th>
            <th>회사</th>
            <th>보험료</th>
            <th>보장기간</th>
            <th>보장내역</th>
          </tr>
       
        <%
		while(rs1.next()){
			
			//String getID = rs1.getString("user_id");
			//if(id.equals(getID)) {
				String insId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");

				rs2 = stmt2.executeQuery("select company, fee, period, ensure from insurance_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String fee = rs2.getString("fee");
				String insPeriod = rs2.getString("period");
				String ensure = rs2.getString("ensure");
				
				out.println("<tr>");
				%><td><a href="onsultCtmInsuranceView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(insId);
				session.setAttribute("insId", insId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("<td>" + fee + "</td>");
				out.println("<td>" + insPeriod + "</td>");
				out.println("<td>" + ensure + "</td>");
				out.println("</tr>");
			}
	//	}
		%>      
       </table>

   <!-- 펀드테이블 -->   
   <% rs1 = stmt.executeQuery("SELECT * FROM fund WHERE user_id = '"+ searchStr  +"'"); %>
       <h4>- 펀드</h4>
       <table id="productCtmAll">
          <tr>
             <th>펀드번호</th>
            <th>상품이름</th>
            <th>가입일</th>
            <th>월적립</th>
            <th>거치금액</th>
            <th>회사</th>
            <th>유형</th>
          </tr>
       
       <%
		while(rs1.next()){
			
			//String getID = rs1.getString("user_id");
			//if(id.equals(getID)) {
				String funId = rs1.getString("id");
				String name = rs1.getString("name");
				String day = rs1.getString("day");
				String month = rs1.getString("month");
				String money = rs1.getString("money");
				
				rs2 = stmt2.executeQuery("select company, type from fund_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String type = rs2.getString("type");
				
				out.println("<tr>");
				%><td><a href="onsultCtmFundView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(funId);
				session.setAttribute("funId", funId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("<td>" + month + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("<td>" + type + "</td>");
				out.println("</tr>");
			}
	//	}
		%></tbody></table><br><%

		//저축(적금/예금)---------------------------------------------------------------------
		
		rs1 = stmt.executeQuery("SELECT * FROM saving WHERE user_id = '"+ searchStr  +"'");
		%>
		<h4>- 저축</h4>
       <table id="productCtmAll">
       <table>
	    <thead>
			<th>저축번호</th>
			<th>상품이름</th>
			<th>납입기간</th>
			<th>월납입</th>
			<th>예금액</th>
			<th>회사</th>
		</thead>
		<tbody id="customTbody">
		<%
		while(rs1.next()){
			
			//String getID = rs1.getString("user_id");
		//	if(id.equals(getID)) {
				String savId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String month = rs1.getString("month");
				String money = rs1.getString("money");
				
				rs2 = stmt2.executeQuery("select company from saving_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				
				out.println("<tr>");
				%><td><a href="onsultCtmSavingView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(savId);
				session.setAttribute("savId", savId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + month + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("</tr>");
			//}
		}
		%> 
       </table>
       
    
		
	<%}
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("연결실패");
	}
%>
       
    </div>
    
</div>
</body>
</html>