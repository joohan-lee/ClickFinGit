<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userId");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 고객 로그인.</title>
 <meta charset="UTF-8">

</head><font size = "20px" ,style = "text-align:center">Click Fin _ 고객모드</font>

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
        margin: 0;
        padding: 0;
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
    <div style = "text-align:right" ><%=id %>님 환영합니다.<br>
    <a href ="logout.jsp">로그아웃</a>
    <ul id="navi">
        <li class="group">
            <div class="title">개인정보</div>
            <ul class="sub">
                <li><a href="mypage.jsp">내 정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">상품별 현황 보기</div>
            <ul class="sub">
                <li><a href="#">가입상품 전체 현황</a></li>                
                <li><a href="#">상품별 상세 현황</a></li>
                <li><a href="#">타상품 상세 현황</a></li>
            </ul>
        </li>       
    </ul>
    <h1>가나다</h1>
    </div>
</body>
</html>