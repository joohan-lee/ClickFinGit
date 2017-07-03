<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
</head><font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
</style>

<body>
	<br>
    <div style = "text-align:right" ><%=id %>님 환영합니다.<br>
    <a href ="logout.jsp" >로그아웃</a></div>
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
    </div>
    <div id="content" style="text-align: left;width:500px;float:left;margin-left:30px;" >
    	<h2>내 정보</h2>
    	<table>
    	<tr>
    		<th>이름 : </th>
    		<td><%=consultMyName %><!-- DB에서 받아오기 --> </td>
    	</tr>
    	<tr>
    		<th>전화번호 : </th>
    		<td>010-1234-5678 </td>
    	</tr>
    	<tr>
    		<th>주소 : </th>
    		<td>서울특별시 강남구 </td>
    	</tr>
    	<tr>
    		<th>이메일 : </th>
    		<td>abc@naver.com</td>
    	</tr>
    	</table>
    </div>
</div>
<form>
	<input type="button" value="개인정보수정" 
	onclick="location.href='http://SaucK:8080/ClickFin/consultMyInfoModify.jsp'" >
</form>
</body>
</html>