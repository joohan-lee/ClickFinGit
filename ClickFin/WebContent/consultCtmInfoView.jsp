<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% String userId = "";
	userId = (String)session.getAttribute("userID");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("�߸��� �α���");
		location.href("login.html");
		</script><%
		
	}%>
    
    <%String searchStr = request.getParameter("searchStr");//�˻��Ϸ��� ���ڿ�
    	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ���� ��������</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
td,tr,th{
	border: 1px gray solid;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp" >�α׾ƿ�</a></div>
<!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;float:left;">
    <ul id="navi">
        <li class="group">
            <div class="title">������Ʈ</div>
            <ul class="sub">
                <li><a href="consultMyInfoView.jsp">��������</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">������</div>
            <ul class="sub">
                <li><a href="consultShowAllCustom.jsp">�� ��ü ��Ȳ</a></li>
                <li><a href="consultCtmInfoView.jsp">���� ��������</a></li>
                <li><a href="#">���� ���Ի�ǰ��Ȳ</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">��ǰ�� ��Ȳ</div>
            <ul class="sub">
                <li><a href="#">����</a></li>                
                <li><a href="#">����</a></li>
                <li><a href="#">�ݵ�</a></li>
                <li><a href="#">���� ����</a></li>
                <li><a href="#">��Ÿ</a></li> 
            </ul>
        </li>          
    </ul>
    </div>
<!-- customer's personal Info View -->
	<div id="content" style="width: 800px;">
		<h2>�� ��������</h2>
		<form action="consultCtmInfoView.jsp">
		
		<select id="searchCond" style="width:100px;">
			<option value="��ü">-��ü-</option>
			<option value="�̸�">�̸�</option>
			<option value="����ó">����ó</option>
		</select>
		
		<!-- ���õ� select�޴� -->
		<script type="text/javascript">
    function CheckSelect(){
        var ctrlSelect = document.getElementById("searchCond");
        if( ctrlSelect.selectedIndex == 0){
            //alert("���ɻ����� �����Ͻÿ�.");
            ctrlSelect.focus();
        }else{
            //window.alert("����� ���ɻ��� : " + ctrlSelect.value );
        }
    }
  </script>
		
		
		<input type="text" name="searchStr" style="width:300px">
		<input type="submit" value="�˻�" onclick="CheckSelect();")>
		
		</form>
	<%
	if(!"".equals(searchStr))//�˻��Ϸ��� ���ڿ��� DB���� �˻��ϰ� �����ϸ� ���
	{
	%>	
		<br>
		<table width="70%"style="border-collapse:collapse;
				border: 1px solid gray;">
			<tr>
				<th>�̸�</th>
				<td><%= searchStr%></td>
			</tr>
			<tr>
				<th>����</th>
				<td>��</td>
			</tr>
			<tr>
				<th>�ֹι�ȣ</th>
				<td>123456-987654</td>
			</tr>
			<tr>
				<th>����ó</th>
				<td>010-2418-5678</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>����Ư���� ������ ���ﵿ</td>
			</tr>
			<tr>
				<th>��ȥ����</th>
				<td>��</td>
			</tr>
			<tr>
				<th>�ڳ�</th>
				<td>
					<ol>
						<li>ȫ��� : 970224</li>
						<li>ȫ�μ� : 980725</li>
					</ol>
				</td>
			</tr>
			<tr>
				<th>�����</th>
				<td></td>
			</tr>
			<tr>
				<th>��Ÿ</th>
				<td></td>
			</tr>
		</table>
	<% }%>
<!-- Button for modifying Customers' personal Info -->
	<div width="70%">
		<br>
		<form action="consultCtmInfoModify.jsp">
		<%session.setAttribute("searchStr",searchStr);
		//response.sendRedirect("consultCtmInfoModify.jsp");%>
		<input type="button" value="�˻��� ����������" style="float:right;"
			onclick="location.href='consultCtmInfoModify.jsp'")>
		</form>
	</div>
	
	</div>
</div>


</body>
</html>