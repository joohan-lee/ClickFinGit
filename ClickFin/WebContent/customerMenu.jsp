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
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="KYG">
  <meta name="Keywords" content="menu">
  <meta name="Description" content="menu" >
  
  <Title></title>
  <style type = text/css>
  
<!--
#topmenu
 {
 height: 50px;
 width : 1213px;
 }

#topmenu ul
{
list-style-type: none;
margin: 0px;
padding: 0px;
}

#topmenu ul li
 {
  color : white;
  float: left;
  line-height : 70px;
  vertical-align: middle; 
  text-align: center;
  position: relative;
 }

.menulink
 {
 color :#3D3D3D;
 text-decoration  :none;
 font-family : "넥슨 풋볼고딕 B";
 display: block;
 width: 190px;
 font-size: 18px;
 font-weight: bold;
 }

.submenulink{
color: #2d2d2d;
text-decoration : none;
font-family: "맑은고딕"
display: block;
width : 1213px;
font-size: 14px;
font-weight : bold;
z-index : 2;
}

 .topmenuLi:hover .menulink
 {
 color : #FF3636;
 }


.submenu {
position : absolute;
height: 0px;
overflow: hidden;
transition: height .2s;
-webkit-transition: height .2s;
-moz-transition: height .2s;
-o-transition: height .2s;
}

.topmenuLi:hover .submenu {
height: 400px;
}
.submenulink:hover{
color : red;
}
-->
  </style>
  <head>
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
<hr width = "100%" size = "-1" color ="#E7E7E7">

 </body>
</html>
