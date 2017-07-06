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
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>고객관리 - 고객 투자 상품 상세정보수정</title>


</head>

<style>
tr, td, th{
	border:1px gray solid;
}
th{
	background:#E9E6E6;
}
td input{
	width:100%;
	height:100%;
	border:0;
}
</style>


<body>

<div id="content" style="width:400px">
	<form action="//고객 상품정보, 증서 보낼 jsp로 전송" method="post" enctype="multipart/form-data">
	<table style="border-collapse:collapse;border:1px gray solid;
		text-align: center;float:center;">
		<tr>
			<th>상품명</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>투자기간</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>투자금액</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>투자수익률</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>배당금지급일</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>총지급배당금</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>기지급배당금</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>추가지급배당금</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>증서 스캔본 업로드</th>
			<td><input type="file" name="//파일 받아올 jsp에서 이용할 name"></td>
		</tr>
	</table>
	<input type="submit" value="저장" onclick="history.back();"
		style="float:right;margin-top:10px">
	
	</form>
	
</div>

</body>
</html>