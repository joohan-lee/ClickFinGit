<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="customerMyInfo.jsp" class="submenulink">내 정보&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
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
<title>클릭핀 고객 모드</title>
</head>
<body>
<div class ="loginSquare"><br><br><%=user_id %></b> 님 환영합니다 ! <br>최근 접속 : 2017.07.06 <br> 접속회수 3 / 1111<br>
    </div>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" onClick="location.href = 'logout.jsp'" value="로그아웃" >
&nbsp;&nbsp;
<input type="button" onClick="location.href = 'logout.jsp'" value="마이 페이지">         
 
   <div class = "menuSquare"></div>
</body>
</html>