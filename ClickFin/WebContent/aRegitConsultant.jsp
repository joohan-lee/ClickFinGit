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
            alert('���̵� �Է��ϼ���');
            return;
      }   
     
      var url ="check_id.jsp?input_id=" + input_id; 
      window.open(url, '',  'width=300, height=350, left=0, top=0');
      
      <%
      String chk = (String)session.getAttribute("chkID");
      if(chk == "t"){
            %>alert("��� ������ ID �Դϴ�!!");<%
      }
      else if(chk == "f"){
    	  %>alert("�̹� ���Ե� ID �Դϴ�");<%
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
<title>Ŭ���� - ������ ����</title>

</head>
<body>

	<div style="text-align: center">
		<font size="10em">������Ʈ ���</font> <br> <br>
		<form method="post" action="" name="consultantInput"
			/
			onSubmit="return checkIt()">
			<table width="50%"
				style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;"
				cellpadding="5">
				<tr>
					<td width="30%"><div style="text-align: center">���̵�</div></td>

					<td width="70%"><div style="text-align: center">
							<input type="text" size="13" name="ID"> <input
								type="button" value="�ߺ�üũ" onclick="check_id()">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�н�����</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="pw1">
						</div></td>
				<tr>
					<td width="30%"><div style="text-align: center">�н����� Ȯ��</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="password" name="pw2"> <input type="button"
								value="��й�ȣ üũ" onclick="pw_check()">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�ֹε�Ϲ�ȣ</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="6" maxlength="6" name="rrn1"> -
							<input type="text" size="7" maxlength="7" name="rrn2">
						</div></td>

				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">�ּ�</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="50" name="addr">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">��ȭ��ȣ</div></td>
					<td width="70%"><div style="text-align: center"
							name="phone_num">
							<input type="text" size="13" maxlength="13">
						</div></td>
				</tr>
			</table>
			<br> <input type="submit" value="���"
				style="margin-left: auto; margin-right: auto;">
		</form>
	</div>


</body>
</html>