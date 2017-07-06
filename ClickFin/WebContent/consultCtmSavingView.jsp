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
		
	}
	%>
    <%String searchStr = (String)session.getAttribute("searchStr"); %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객관리 - 고객 저축 상품 상세정보</title>


</head>

<style>
tr, td, th{
	border:1px gray solid;
}
th{
	background:#E9E6E6;
}
</style>


<body>

<div id="content" style="width:400px">
	<h1><%=searchStr%>고객 저축상품 보기</h1>
	<table style="border-collapse:collapse;border:1px gray solid;
		text-align: center;height:500px;width:400px;float:center;">
		<tr>
			<th>회사</th>
			<td></td>
		</tr>
		<tr>
			<th>상품명</th>
			<td>170705-170805</td>
		</tr>
		<tr>
			<th>납입기간</th>
			<td></td>
		</tr>
		<tr>
			<th>월납입/예금액</th>
			<td></td>
		</tr>
		<tr>
			<th>현재 적립금액</th>
			<td></td>
		</tr>
		<tr>
			<th>만기 예상금액</th>
			<td></td>
		</tr>
		<tr>
			<th>증서 스캔본</th>
			<td></td>
		</tr>
	</table>
	
	<form action="">
		<input type="button" value="확인" onclick="history.back();" 
			style="position:relative;left:50%;margin:10px" >
		<input type="button" value="수정하기" onclick="location.href='consultCtmInvestModify.jsp'"
			style="float:right;margin-top:10px" > 
	</form>
</div>

</body>
</html>