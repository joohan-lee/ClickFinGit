<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
    <%String searchStr = request.getParameter("searchStr"); 
    session.setAttribute("searchStr",searchStr);%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객 상품 등록</title>


</head>

<style>
ul li input{
	top-margin:5px;
	bottom-margin:5px;
}
li{
	float:left;
	width:130px;
}

.button {
border:1x solid #ff0080;    /*---테두리 정의---*/
background-Color:#14D3FF;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:#000010;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}
</style>

<body>
<div id="container" style="width:1000px">
	
	<div id="content">
		<h2>상품 등록하시고자 하는 고객님의 아이디를 입력해주십시오.</h2>
		<form action="" method="post">
			<input type="text" name="searchStr">
			<input type="submit" value="아이디확인" title="고객 id존재하는지 확인"
				onclick="//DB존재확인, 존재하면 existCtm=true;">
		</form>
		
		<%if(!"".equals(searchStr)&&searchStr!=null){//+ 해당 아이디가 DB에 존재하면 %>
			<h2><%=searchStr%>고객님의 등록하시고자 하는 상품을 선택하십시오. </h2>
			<ul>
				<li>
					<input type="button" value="투자등록" class="button"
						onclick="location.href='consultCtmInvestRegist.jsp'">
				</li>
				<li>
					<input type="button" value="보험등록" class="button"
						onclick="location.href='consultCtmInsuranceRegist.jsp'">
				</li>
				<li>
					<input type="button" value="펀드등록" class="button"
						onclick="location.href='consultCtmFundRegist.jsp'">
				</li>
				<li>
					<input type="button" value="저축등록" class="button"
						onclick="location.href='consultCtmSavingRegist.jsp'">
				</li>
			</ul>
		<%}%>
		
	
	</div>
	<div style="width:300px">
		<input type="button" value="취소" style="margin:10px;float:right"
		onclick="location.href='consultShowAllCustom.jsp'">
	</div>
</div>
</body>
</html>