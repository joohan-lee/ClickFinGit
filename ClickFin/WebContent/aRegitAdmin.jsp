<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
var click_chk = 0;

function check_id()
{	  
      var get_id = document.admininput.input_id.value;
      
      if( get_id == '' )
      {
            alert('아이디를 입력하세요');
            return;
      }
      else if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    	        || event.keyCode == 46 ) return;
      else
      { 
    	 	var url = "check_id.jsp?get_id="+get_id;
    		var ret = window.showModalDialog(url,get_id,"width = 150 , height = 100, resizable = no, scrollbars = no");

    		if(ret =='cancel'){
    			alert('ID 확인 취소');
    			document.getElementById('input_id').disabled = false;
    			document.setElementById('checked_id').value = "false";
    			click_chk = 0;
    		}
    		else if(ret != 'cancel' && ret!= 'disable'){ 			
    			   			
    			document.getElementById('input_id').disabled = 'disabled';
    			document.getElementById('ID').value = get_id;
    			document.getElementById('checked_id').value ="true";
    		}
      }
}

function numkeyCheck(e){ 
	var keyValue = event.keyCode; 
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true; 
	else 
		return false; 
	}

</script>
<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>클릭핀 - 관리자 접속</title>

</head>
<body>

	<div style="text-align: center">
		<font size="8">관리자 등록</font> <br> <br>
		<form method="post" action = "aInsertAdminInfo.jsp" name="admininput"
			onSubmit="return checkIt()">
			<table width="50%"
				style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;"
				cellpadding="5">
				<tr>
					<td width="30%"><div style="text-align: center">아이디</div></td>

					<td width="70%"><div style="text-align: center">
							<script></script>
							<input type="text" size="13" name="input_id" id = "input_id" style='ime-mode:disabled'> <input
								type="button" value="중복체크" onclick="check_id()" id = "chk_id">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">이름</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" name="input_name" id = "input_name">
						</div></td>
				<tr>
				<tr>
					<td width="30%"><div style="text-align: center">패스워드</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="input_pw1" id = "input_pw1">
						</div></td>
				<tr>
					<td width="30%"><div style="text-align: center">패스워드 확인</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="input_pw2" id = "input_pw2"> 
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">주민등록번호</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="6" maxlength="6" name="input_rrn1" id = "input_rrn1"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)"> -
							<input type="text" size="7" maxlength="7" name="input_rrn2" id = "input_rrn2"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)">
						</div></td>

				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">주소</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="50" name="input_addr" id = "input_addr">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">이메일</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="15" maxlength = "15" name="input_mail1" id = "input_mail1">
							@ <input type = "text" size = "15" maxlength ="15" name = "input_mail2" id = "input_mail2"> 
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">전화번호</div></td>
					<td width="70%"><div style="text-align: center" name="phone_num">
							<input type="text" size="4" maxlength="4" id = "input_phonenum1"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)" name = "input_phonenum1"> -
							<input type="text" size="4" maxlength="4" id = "input_phonenum2"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)" name = "input_phonenum2"> -
							<input type="text" size="4" maxlength="4" id = "input_phonenum3" name = "input_phonenum3"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)">
						</div></td>
				</tr>
			</table>
			<input type = "hidden" value = "" id = "checked_id" name = "checked_id">
			<input type = "hidden" value = "" id = "ID" name = "ID">
			<br> <input type="submit" value="등록"
				style="margin-left: auto; margin-right: auto;">
		</form>
	</div>


</body>
</html>