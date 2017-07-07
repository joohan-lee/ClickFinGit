<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>//alert("잘못된 로그인");
		//location.href("login.html");
		</script><%
		
	}%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>컨설턴트 - 고객등록하기</title>


</head>

<style>
table{
	border-collapse:collapse;
	border:1px gray solid;
}
tr, td, th{
	border: 1px gray solid;
}
th{
	background:#E9E6E6;
	width:100px;
}
td input{
	width:100%;
	height:100%;
	border:0;
}
#rrn input{
	width:45%;
}
</style>

<body>
<div id="content">
	<h1>고객 등록하기</h1>
	<form method="post" action="//DB저장할 파일로" id="frm">
	<table width="500px"style="border-collapse:collapse;
            border: 1px solid gray;">
         <tr>
         	<th>아이디</th>
         	<td><input type="text" name="cusId"></td>
         	<!-- DB에 이 입력한 아이디 받아서 존재하는지 check_validId만들어 확인 -->
         	<td width="70px">
         	<input type="button" value="아이디확인"
         	title="승인받은 아이디인지 확인"	onclick="check_vaildId();">
         	</td>
         </tr>

         <script>
         	function check_validId(){
         		var check_permittedId;//DB존재여부확인한 jsp의 check_permittedId값을 대입
         		if(permitted_id==false)
         			alert('승인되지 않은 아이디입니다.');
         	}
         </script>
         <tr>
            <th>이름</th>
            <td><input type="text" name="cusName"></td>
         </tr>
         <tr>
            <th>주민번호</th>
            <td id="rrn">
            <input type="text" name="cusRrnFirst" width="40%"maxlength="6"
            	style="ime-mode:disabled;"onkeyPress="InputOnlyNumber(this);" >
            -
            <input type="password" name="cusRrnSecond" width="40%"maxlength="7"
            	style="ime-mode:disabled;"onkeyPress="InputOnlyNumber(this);" >
            </td>
         </tr>
         <tr>
            <th>연락처</th>
            <td><input type="text" id="number_value" name ="cusPhone"
            	style="ime-mode:disabled;" onkeyPress="InputOnlyNumber(this);" maxlength="11"></td>
         </tr>
         <tr>
            <th>주소</th>
            <td><input type="text" name ="cusAddress"></td>
         </tr>
         <tr>
            <th>결혼유뮤</th>
            <td><input type="text" name = "cusMarry"></td>
         </tr>
         <tr>
            <th>자녀</th>
            <td>
                <input type="text" name="cusChild">
            </td>
         </tr>
         <tr>
            <th>기념일</th>
            <td><input type="text" name ="cusAnniversary"></td>
         </tr>
         
         
    </table>
	<input type="button" value="등록" onclick="consulRegistCtmOK.jsp;">
	<input type="button" value="취소" onclick="history.back();">
	
	<script type="text/javascript">
	function askCtmRegister(){
		if(confirm("등록 완료하시겠습니까?")==true){
			document.getElementById("frm").submit();
			//제출하면 action의 jsp실행되므로 거기서 수행 후  history.back()
		}
		else{
			return;
		}
	}
	</script>
	
	<script>
         		function InputOnlyNumber(obj){
         			if(event.keyCode>=48&&event.keyCode<=57){
         				//숫자키만입력
         				return true;
         			}
         			else{
        				event.returnValue=false;
         			}
         			
         		}
         		
   	</script>
	
	
	
	</form>
	
</div>

</body>
</html>