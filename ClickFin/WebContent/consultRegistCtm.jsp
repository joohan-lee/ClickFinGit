<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("�߸��� �α���");
		location.href("login.html");
		</script><%
		
	}%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������Ʈ - ������ϱ�</title>


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
	<h1>�� ����ϱ�</h1>
	<form method="post" action="//DB������ ���Ϸ�" id="frm">
	<table width="500px"style="border-collapse:collapse;
            border: 1px solid gray;">
         <tr>
         	<th>���̵�</th>
         	<td><input type="text" name=""></td>
         	<!-- DB�� �� �Է��� ���̵� �޾Ƽ� �����ϴ��� check_validId����� Ȯ�� -->
         	<td width="70px">
         	<input type="button" value="���̵�Ȯ��"
         	title="���ι��� ���̵����� Ȯ��"	onclick="check_vaildId();">
         	</td>
         </tr>

         <script>
         	function check_validId(){
         		var check_permittedId;//DB���翩��Ȯ���� jsp�� check_permittedId���� ����
         		if(permitted_id==false)
         			alert('���ε��� ���� ���̵��Դϴ�.');
         	}
         </script>
         <tr>
            <th>�̸�</th>
            <td><input type="text" name=""></td>
         </tr>
         <tr>
            <th>�ֹι�ȣ</th>
            <td id="rrn">
            <input type="text" name="rrn" width="40%"maxlength="6"
            	style="ime-mode:disabled;"onkeyPress="InputOnlyNumber(this);" >
            -
            <input type="password" name="rrn_second" width="40%"maxlength="7"
            	style="ime-mode:disabled;"onkeyPress="InputOnlyNumber(this);" >
            </td>
         </tr>
         <tr>
            <th>����ó</th>
            <td><input type="text" id="number_value"
            	style="ime-mode:disabled;" onkeyPress="InputOnlyNumber(this);" maxlength="11"></td>
         </tr>
         <tr>
            <th>�ּ�</th>
            <td><input type="text"></td>
         </tr>
         <tr>
            <th>��ȥ����</th>
            <td><input type="text"></td>
         </tr>
         <tr>
            <th>�ڳ�</th>
            <td>
               <ol>
                  <li><input type="text" name="child1"></li>
                  <li><input type="text" name="child2"></li>
               </ol>
            </td>
         </tr>
         <tr>
            <th>�����</th>
            <td><input type="text"></td>
         </tr>
         
         
    </table>
	<input type="button" value="���" onclick="askCtmRegister();">
	<input type="button" value="���" onclick="history.back();">
	
	<script type="text/javascript">
	function askCtmRegister(){
		if(confirm("��� �Ϸ��Ͻðڽ��ϱ�?")==true){
			document.getElementById("frm").submit();
			//�����ϸ� action�� jsp����ǹǷ� �ű⼭ ���� ��  history.back()
		}
		else{
			return;
		}
	}
	</script>
	
	<script type="text/javascript">
         		function InputOnlyNumber(obj){
         			if(event.keyCode>=48&&event.keyCode<=57){
         				//����Ű���Է�
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