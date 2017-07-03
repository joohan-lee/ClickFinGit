<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String userId = "";
	userId = (String)session.getAttribute("userID");
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
<title>고객 관리 - 고객 전체 현황</title>
<link rel="stylesheet" href="navbar.css">


</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
td, tr, th{
	border: 1px gray solid;
	text-align: center;
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
    </div>
    <div id="content" style="width: 800px">
    	<h2>고객관리</h2>
    	<form action="consultShowAllCustom.jsp">
    		<input type="text" name="customName">
    		<input type="button" value="검색" onclick="add_row()">
    	</form>
<!-- 순번, 고객명, 호칭, 별칭, 회사명, 연락처, 펀드건, 보험건 -->
    	<table width="70%"
    	style="border-collapse:collapse;border:1px gray solid;
    	margin-top: 20px;">
    	<thead>
			<th>순번</th>
			<th>고객명</th>
			<th>호칭</th>
			<th>별칭</th>
			<th>회사명</th>
			<th>연락처</th>
			<th>펀드건</th>
			<th>보험건</th>
    	</thead>
		<tbody id="customTbody">
<!-- 고객수에 따라  행추가해서 출력 -->
		</tbody>
		<script>
			function add_row(){
				var my_tbody = document.getElementById('customTbody');
				var row = customTbody.insertRow(customTbody.rows.length);
				for(var i=0;i<8;i++){
					var cell= row.insertCell(i);
					cell.innerHTML = '항목';
				}
			}
		</script>
		
    	</table>
    
    </div>
</div>


</body>
</html>