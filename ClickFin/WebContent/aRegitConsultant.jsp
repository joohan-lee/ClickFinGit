<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
function check_id()
{
      var input_id = document.consultantInput.ID.value;
      if( input_id == '' )
      {
            alert('아이디를 입력하세요');
            return;
      }   
     
      var url ="check_id.jsp?input_id=" + input_id; 
      window.open(url, '',  'width=300, height=350, left=0, top=0');
      
      <%
      String chk = (String)session.getAttribute("chkID");
      if(chk == "t"){
            %>alert("사용 가능한 ID 입니다!!");<%
      }
      else if(chk == "f"){
    	  %>alert("이미 가입된 ID 입니다");<%
      }%>
}

</script>
<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 - 관리자 접속</title>

</head>
<body>

	<div style="text-align: center">
		<font size="10em">컨설턴트 등록</font> <br> <br>
		<form method="post" action="" name="consultantInput"
			/
			onSubmit="return checkIt()">
			<table width="50%"
				style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;"
				cellpadding="5">
				<tr>
					<td width="30%"><div style="text-align: center">아이디</div></td>

					<td width="70%"><div style="text-align: center">
							<input type="text" size="13" name="ID"> <input
								type="button" value="중복체크" onclick="check_id()">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">패스워드</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="pw1">
						</div></td>
				<tr>
					<td width="30%"><div style="text-align: center">패스워드 확인</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="pw2"> <input type="button"
								value="비밀번호 체크" onclick="pw_check()">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">주민등록번호</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="6" maxlength="6" name="rrn1"> -
							<input type="text" size="7" maxlength="7" name="rrn2">
						</div></td>

				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">주소</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="50" name="addr">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">전화번호</div></td>
					<td width="70%"><div style="text-align: center"
							name="phone_num">
							<input type="text" size="13" maxlength="13">
						</div></td>
				</tr>
			</table>
			<br> <input type="submit" value="등록"
				style="margin-left: auto; margin-right: auto;">
		</form>
	</div>


</body>
</html>