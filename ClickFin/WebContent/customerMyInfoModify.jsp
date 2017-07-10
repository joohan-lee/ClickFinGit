<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String user_id = (String)session.getAttribute("userId");
	if(user_id == null || user_id.equals(""))
	{
		%><script>alert("잘못된 로그인");
		parent.location.href("login.html");
		</script><%
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="style.css" />
<nav id ="topmenu"> 

	<ul>
	<li><img src="HSR logo.png"></li>
		
	  <li class="topmenuLi">
	    <a class="menulink" href="#">개인정보</a>
			<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfo.jsp" class="submenulink">내 정보&nbsp;&nbsp;&nbsp;</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfoModify.jsp" class="submenulink">내 정보 수정&nbsp;&nbsp;</a></li>
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
<title>개인정보수정</title>

</head>
<body>
<div class ="loginSquare"><br><br><%=user_id %></b> 님 환영합니다 ! <br>최근 접속 : 2017.07.06 <br> 접속회수 3 / 1111<br>
    </div>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" onClick="location.href = 'logout.jsp'" value="로그아웃" >
&nbsp;&nbsp;
<input type="button" onClick="location.href = 'logout.jsp'" value="마이 페이지">         
 
   <div class = "menuSquare"></div>

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

		rs1 = stmt.executeQuery("SELECT id, name, period, month, money, user_id FROM saving WHERE id = '"+ id  +"'");
		rs1.next();

		String savId = rs1.getString("id");
		String name = rs1.getString("name");
		String period = rs1.getString("period");
		String month = rs1.getString("month");
		String money = rs1.getString("money");
		
		rs2 = stmt.executeQuery("select company from saving_product where name ='"+ name +"'");
		rs2.next();
		String company = rs2.getString("company");
		
		out.println("<td>" + savId + "</td>");
		out.println("<td>" + name + "</td>");
		out.println("<td>" + period + "</td>");
		out.println("<td>" + month + "</td>");
		out.println("<td>" + money + "</td>");
		out.println("<td>" + company + "</td>");
		out.println("</tr>");
		%></tbody></table><%
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("연결실패");
	}

%>



   
<div id="container" style="width:1000px">
	<div id="header" style="font-size: 30px;text-align: center;">
	<%=searchStr %>고객님의 정보 수정
	</div>
	<div id="content">
	<form action="consultCtmInfoModifyOK.jsp">
	<table width="70%">
    	<tr>
    		<th>이름 : </th>
			<td><input type="text" value="<%=name%>" name="cusMyName" value="<%//DB에서 불러온거로 SET %>"> </td>
		</tr>
    	<tr>
    		<th>주민번호 : </th>
    		<td><input type="text" value="<%=rrn %>" name="cusMyRrn" ></td>
    	</tr>
    	<tr>
    		<th>연락처 : </th>
    		<td><input type="text" value="<%=phone %>" name="cusMyPhone" ></td>
    	</tr>
    	<tr>
    		<th>주소 : </th>
    		<td><input type="text" value="<%=address%>" name="cusMyAddress" ></td>
    	</tr>
    	<tr>
    		<th>결혼유뮤 : </th>
    		<td><input type="text" value="<%=marry%>" name="cusMyMarry" ></td>
    	</tr>
    	<tr>
    		<th>자녀: </th>
    			<td><input type="text" value="<%=child%>" name="cusMyChild" ></td>
    	</tr>
    	<tr>
    		<th>기념일</th>
    		<td><input type="text" value="<%=anniversary%>" name="cusMyAnniversary" ></td>
    	</tr>
	</table>
	
	<input type="submit" value="저장" ><!-- 확인 누를 때 저장했는지 물어보는거 추가 -->
	<input type="button" value="취소" 
		onclick="location.href='consultCtmInfoView.jsp'">
	</form>
	
	
	</div>
	<%session.removeAttribute(searchStr);%>
</div>

</body>
</html>