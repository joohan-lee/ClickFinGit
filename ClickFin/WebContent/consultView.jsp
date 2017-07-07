<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>//alert("잘못된 로그인");
		//location.href("login.html");
		</script><%
		
	}
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 컨설턴트 홈</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="navbar.css">
<link rel="stylesheet" type="text/css" href="style.css">

</head>

<style>
</style>

<nav id ="topmenu"> 

	<ul>
	<li><img src="HSR logo.png"></li>
		
	  <li class="topmenuLi"> <!-- 상단 메뉴 -->
	    <a class="menulink" href="#">컨설턴트</a>
			<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">개인정보</a></li>
			</ul>
		</li>
			<li>|</li>
	<li class="topmenuLi">
		<a class="menulink" href="#">고객관리</a>
			<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">고객 전체 현황</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">고객별 개인정보</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink" >고객별 가입상품현황</a></li>
				
			</ul>
		</li>
			<li>|</li>
	<li class="topmenuLi">
		<a class="menulink" href="#">상품별 전체 현황</a>
		<ul class="submenu">
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">투자</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">보험</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">펀드</a></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="submenulink">저축</a></li>
				
			</ul>
		</li>
			<li>|</li>
	</ul> 

</nav> 


<body>
	<br>
	<div id="header" style="width: 1000px;text-allign:center;">
		<h1 style = "size: 20px">Click Fin _ 컨설턴트모드</h1>
	</div>
    <div style = "text-align:right"><%=userId %>님 환영합니다.<br>
    <a href ="logout.jsp">로그아웃</a>
<!-- navigator -->
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
                <li><a href="#">보험</a></li>
                <li><a href="#">펀드</a></li>
                <li><a href="#">적금 예금</a></li>
                <li><a href="#">기타</a></li> 
            </ul>
        </li>          
    </ul>
    
</body>
</html>