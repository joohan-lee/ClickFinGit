<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
var click_chk = 0;

function check_id()
{	  
      var input_id = document.consultantInput.ID.value;
      
      if( input_id == '' )
      {
            alert('���̵� �Է��ϼ���');
            return;
      }
      else if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    	        || event.keyCode == 46 ) return;
      else
      { 
    	 	var url = "check_id.jsp?input_id="+input_id;
    		var ret = window.showModalDialog(url,input_id,"width = 150 , height = 100, resizable = no, scrollbars = no");

    		if(ret =='cancel'){
    			alert('ID Ȯ�� ���');
    			document.getElementById('ID').disabled = false;
    			document.setElementById('checked_id').value = "true";
    			click_chk = 0;
    		}
    		else if(ret != 'cancel' && ret!= 'disable'){ 			
    			   			
    			document.getElementById('ID').disabled = 'disabled';
    			document.setElementById('ID').value = ret;
    			click_chk = 1;
    			document.setElementById('checked_id').value = "true";
    			alert(click_chk);
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ŭ���� - ������ ����</title>

</head>
<body>

	<div style="text-align: center">
		<font size="10em">������Ʈ ���</font> <br> <br>
		<form method="post" action = "aInsertConsultantInfo.jsp" name="consultantInput"
			onSubmit="return checkIt()">
			<table width="50%"
				style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;"
				cellpadding="5">
				<tr>
					<td width="30%"><div style="text-align: center">���̵�</div></td>

					<td width="70%"><div style="text-align: center">
							<script></script>
							<input type="text" size="13" name="ID" id = "ID" style='ime-mode:disabled'> <input
								type="button" value="�ߺ�üũ" onclick="check_id()" id = "chk_id">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�̸�</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" name="input_name" id = "input_name">
						</div></td>
				<tr>
				<tr>
					<td width="30%"><div style="text-align: center">�н�����</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="input_pw1" id = "input_pw1">
						</div></td>
				<tr>
					<td width="30%"><div style="text-align: center">�н����� Ȯ��</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="input_pw2" id = "input_pw2"> 
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�ֹε�Ϲ�ȣ</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="6" maxlength="6" name="input_rrn1" id = "input_rrn1"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)"> -
							<input type="text" size="7" maxlength="7" name="input_rrn2" id = "input_rrn2"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)">
						</div></td>

				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�ּ�</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="50" name="input_addr" id = "input_addr">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�̸���</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="15" maxlength = "15" name="input_main1" id = "input_mail1">
							@ <input type = "text" size = "15" maxlength ="15" name = "input_mail2" id = "input_mail2"> 
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">��ȭ��ȣ</div></td>
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
			<br> <input type="submit" value="���"
				style="margin-left: auto; margin-right: auto;">
		</form>
	</div>


</body>
</html>