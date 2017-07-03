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
    
    <%String searchStr = request.getParameter("searchStr");//검색하려는 문자열
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객관리 - 고객별 개인정보</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
td,tr,th{
	border: 1px gray solid;
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
<!-- customer's personal Info View -->
	<div id="content" style="width: 800px;">
		<h2>고객 개인정보</h2>
		<form action="consultCtmInfoView.jsp">
		
		<select id="searchCond" style="width:100px;">
			<option value="전체">-전체-</option>
			<option value="이름">이름</option>
			<option value="연락처">연락처</option>
		</select>
		
		<!-- 선택된 select메뉴 -->
		<script type="text/javascript">
    function CheckSelect(){
        var ctrlSelect = document.getElementById("searchCond");
        if( ctrlSelect.selectedIndex == 0){
            //alert("관심사항을 선택하시오.");
            ctrlSelect.focus();
        }else{
            //window.alert("당신의 관심사항 : " + ctrlSelect.value );
        }
    }
  </script>
		
		
		<input type="text" name="searchStr" style="width:300px">
		<input type="submit" value="검색" onclick="CheckSelect();")>
		
		</form>
	<%
	if(!"".equals(searchStr))//검색하려는 문자열을 DB에서 검색하고 존재하면 출력
	{
	%>	
		<br>
		<table width="70%"style="border-collapse:collapse;
				border: 1px solid gray;">
			<tr>
				<th>이름</th>
				<td><%= searchStr%></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>남</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td>123456-987654</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>010-2418-5678</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>서울특별시 강남구 역삼동</td>
			</tr>
			<tr>
				<th>결혼유뮤</th>
				<td>유</td>
			</tr>
			<tr>
				<th>자녀</th>
				<td>
					<ol>
						<li>홍길순 : 970224</li>
						<li>홍민수 : 980725</li>
					</ol>
				</td>
			</tr>
			<tr>
				<th>기념일</th>
				<td></td>
			</tr>
			<tr>
				<th>기타</th>
				<td></td>
			</tr>
		</table>
	<% }%>
<!-- Button for modifying Customers' personal Info -->
	<div width="70%">
		<br>
		<form action="consultCtmInfoModify.jsp">
		<%session.setAttribute("searchStr",searchStr);
		//response.sendRedirect("consultCtmInfoModify.jsp");%>
		<input type="button" value="검색한 고객정보수정" style="float:right;"
			onclick="location.href='consultCtmInfoModify.jsp'")>
		</form>
	</div>
	
	</div>
</div>


</body>
</html>