<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userID");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<<<<<<< HEAD
<<<<<<< HEAD
<title>클릭핀 컨설턴트 홈</title>
 <meta charset="UTF-8">

</head>

<style>
    body {
    	float:right
        margin:20px auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.9em;
	}
    ul#navi {
        width: 200px;
        text-indent: 10px;
	}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
	}
    li.group {
        margin-bottom: 3px;
	}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#f4f4f4;
        cursor:pointer;
	}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#ffffff;
        cursor:pointer;
	}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
	}
    ul.sub li:hover {
        background:#f4f4f4;
	}
</style>

<body>
	<br>
	<div id="header" style="width: 1000px;text-allign:center;">
		<h1 style = "size: 20px">Click Fin _ 컨설턴트모드</h1>
	</div>
    <div style = "text-align:right" ><%=id %>님 환영합니다.<br>
    <a href ="logout.jsp">로그아웃</a>
    <ul id="navi">
        <li class="group">
            <div class="title">컨설턴트</div>
            <ul class="sub">
                <li><a href="consultantMyInfo.jsp">개인정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">고객관리</div>
            <ul class="sub">
                <li><a href="#">고객 전체 현황</a></li>
                <li><a href="#">고객별 개인정보</a></li>
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
=======
<title>Insert title here</title>
</head>
<body>
컨설턴트 페이지
>>>>>>> refs/remotes/origin/sukwoo
=======
<title>클릭핀 컨설턴트 홈</title>
 <meta charset="UTF-8">

</head>

<style>
    body {
    	float:right
        margin:20px auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.9em;
	}
    ul#navi {
        width: 200px;
        text-indent: 10px;
	}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
	}
    li.group {
        margin-bottom: 3px;
	}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#f4f4f4;
        cursor:pointer;
	}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#ffffff;
        cursor:pointer;
	}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
	}
    ul.sub li:hover {
        background:#f4f4f4;
	}
</style>

<body>
	<br>
	<div id="header" style="width: 1000px;text-allign:center;">
		<h1 style = "size: 20px">Click Fin _ 컨설턴트모드</h1>
	</div>
    <div style = "text-align:right" ><%=id %>님 환영합니다.<br>
    <a href ="logout.jsp">로그아웃</a>
    <ul id="navi">
        <li class="group">
            <div class="title">컨설턴트</div>
            <ul class="sub">
                <li><a href="consultantMyInfo.jsp">개인정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">고객관리</div>
            <ul class="sub">
                <li><a href="#">고객 전체 현황</a></li>
                <li><a href="#">고객별 개인정보</a></li>
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
>>>>>>> refs/remotes/origin/kiwoong
</body>
</html>