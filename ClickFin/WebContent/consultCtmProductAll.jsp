<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String userId = "";
	userId = (String)session.getAttribute("userId");
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
<title>고객관리 - 고객별 가입상품 현황</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

<style>
table{
	border-collapse:collapse;
	border: 1px gray solid;
}
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
#productCtmAll{
	width:600px
}
html{
	height:100%;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>님 환영합니다.<br>
    <a href ="logout.jsp" >로그아웃</a></div>
    
    
    <!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;height:1000px;float:left;">
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
    </div>
    
<!-- 내용 -->
    <div id="content" style="width: 800px">
    	<h2>고객관리 - 고객별 가입상품현황</h2>
	<!-- 검색 -->
		<form action="">
		
			<select id="searchCond" style="width:100px;">
				<option value="이름">이름</option>
			</select>
		
			
			<input type="text" name="searchStr" style="width:300px">
			<input type="submit" value="검색" onclick="CheckSelect();")>
		
		</form>
		
		<%String searchStr = "";
		searchStr = request.getParameter("searchStr"); %>
		
		
	<!-- 해당 고객 상품 전체 목록 -->
		<%if(!"".equals(searchStr)&&searchStr!=null){
			//DB에 존재하지 않아도 출력되지 않도록 바꾸기 or 존재해야 출력하는 거로 바꾸기%>
    	<h3 style="text-align:center"><%=searchStr%> 님의 상품 목록 </h3>
    <!-- 투자테이블 -->	
    	<h4>- 투자</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>투자번호</th>
				<th>상품이름</th>
				<th>투자기간</th>
				<th>투자금액</th>
				<th>투자수익률</th>
				<th>배당금지급일</th>
    		</tr>
    	
    		<%int i=0;
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="상세보기">inv03</a></td>
    			<td>금투자</td>
    			<td>170705-180705</td>
    			<td>4억</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0; %>
    	</table>
    		
    <!-- 보험테이블 -->	
    	<h4>- 보험</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>투자번호</th>
				<th>상품이름</th>
				<th>투자기간</th>
				<th>투자금액</th>
				<th>투자수익률</th>
				<th>배당금지급일</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="상세보기">inv03</a></td>
    			<td>금투자</td>
    			<td>170705-180705</td>
    			<td>4억</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>

	<!-- 펀드테이블 -->	
    	<h4>- 펀드</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>투자번호</th>
				<th>상품이름</th>
				<th>투자기간</th>
				<th>투자금액</th>
				<th>투자수익률</th>
				<th>배당금지급일</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="상세보기">inv03</a></td>
    			<td>금투자</td>
    			<td>170705-180705</td>
    			<td>4억</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>
    	
    <!-- 적금예금 테이블 -->	
    	<h4>- 적금예금</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>투자번호</th>
				<th>상품이름</th>
				<th>투자기간</th>
				<th>투자금액</th>
				<th>투자수익률</th>
				<th>배당금지급일</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="상세보기">inv03</a></td>
    			<td>금투자</td>
    			<td>170705-180705</td>
    			<td>4억</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>
    		
    <!-- 기타 테이블 -->	
    	<h4>- 기타</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>투자번호</th>
				<th>상품이름</th>
				<th>투자기간</th>
				<th>투자금액</th>
				<th>투자수익률</th>
				<th>배당금지급일</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="상세보기">inv03</a></td>
    			<td>금투자</td>
    			<td>170705-180705</td>
    			<td>4억</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>
    		
    	<%}//검색조건 if close, 조건에 따라 투자~기타 출력%>
    	
    </div>
    
</div>
</body>
</html>