<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String id = "";
	id = (String)session.getAttribute("userId");
	String consultMyName = request.getParameter("consultMyName");
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>컨설턴트 내정보보기</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="navbar.css">
</head>
<font size="20px" ,style="text-align: center">Click Fin _ 컨설턴트모드</font>

<style>
</style>

<body>
	<br>
	<div style="text-align: right"><%=id %>님 환영합니다.<br> <a
			href="logout.jsp">로그아웃</a>
	</div>
	<div id="container" style="width: 1000px;">
		<div id="menu" style="width: 200px; float: left;">
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
						<li><a href="#">고객별 가입상품현황</a></li>
					</ul>
				</li>
				<li class="group">
					<div class="title">상품별 현황</div>
					<ul class="sub">
						<li><a href="#">투자</a></li>
						<li><a href="#">보험</a></li>
						<li><a href="#">펀드</a></li>
						<li><a href="#">적금 예금</a></li>
						<li><a href="#">기타</a></li>
					</ul>
				</li>
			</ul>

			<%
	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users where id='" + id + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
   	
   	//ResultSet get_type = st.executeQuery(get_type_Query);
   		%>

			<%
   		while(rs.next())
   	   	{
   			String name = rs.getString("name");
   			String phone = rs.getString("phone");
   			String address = rs.getString("address");
   			String email = rs.getString("email");
   	   		%>

			<%
session.setAttribute("consultantName", name); 
session.setAttribute("consultantPhone",phone );
session.setAttribute("consultantAddress", address);
session.setAttribute("consultantEmail", email);
%>




		</div>
		<div id="content"
			style="text-align: left; width: 500px; float: left; margin-left: 30px;">
			<h2>내 정보</h2>
			<table>
				<tr>
					<th>이름 :</th>
					<td><%=name %><!-- DB에서 받아오기 --></td>
				</tr>
				<tr>
					<th>전화번호 :</th>
					<td><%=phone %></td>
				</tr>
				<tr>
					<th>주소 :</th>
					<td><%=address %></td>
				</tr>
				<tr>
					<th>이메일 :</th>
					<td><%=email %></td>
				</tr>
			</table>
		</div>
	</div>

	<%}
   	   	
   	
   }catch(Exception e)
   {
   	out.println("ERROR");
   	e.printStackTrace();
   }
%>
	<form>
		<input type="button" value="개인정보수정"
			onclick="location.href='consultMyInfoModify.jsp'">
	</form>
</body>
</html>