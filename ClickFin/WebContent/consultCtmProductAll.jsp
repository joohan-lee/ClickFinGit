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
<title>������ - ���� ���Ի�ǰ ��Ȳ</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
table{
	border-collapse:collapse;
	border: 1px gray solid;
}
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
#productCtmAll{
	width:600px
}
html{
	height:100%;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp" >�α׾ƿ�</a></div>
    
    
    <!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;height:1000px;float:left;">
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
                <li><a href="consultCtmProductAll.jsp">���� ���Ի�ǰ��Ȳ</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">��ǰ�� ��Ȳ</div>
            <ul class="sub">
                <li><a href="consultAllInvestView.jsp">����</a></li>                
                <li><a href="#">����</a></li>
                <li><a href="#">�ݵ�</a></li>
                <li><a href="#">���� ����</a></li>
                <li><a href="#">��Ÿ</a></li> 
            </ul>
        </li>          
    </ul>
    </div>
    
<!-- ���� -->
    <div id="content" style="width: 800px">
    	<h2>������ - ���� ���Ի�ǰ��Ȳ</h2>
	<!-- �˻� -->
		<form action="">
		
			<select id="searchCond" style="width:100px;">
				<option value="�̸�">�̸�</option>
			</select>
		
			
			<input type="text" name="searchStr" style="width:300px">
			<input type="submit" value="�˻�" onclick="CheckSelect();")>
		
		</form>
		
		<%String searchStr = "";
		searchStr = request.getParameter("searchStr"); %>
		
		
	<!-- �ش� �� ��ǰ ��ü ��� -->
		<%if(!"".equals(searchStr)&&searchStr!=null){
			//DB�� �������� �ʾƵ� ��µ��� �ʵ��� �ٲٱ� or �����ؾ� ����ϴ� �ŷ� �ٲٱ�%>
    	<h3 style="text-align:center"><%=searchStr%> ���� ��ǰ ��� </h3>
    <!-- �������̺� -->	
    	<h4>- ����</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>���ڹ�ȣ</th>
				<th>��ǰ�̸�</th>
				<th>���ڱⰣ</th>
				<th>���ڱݾ�</th>
				<th>���ڼ��ͷ�</th>
				<th>����������</th>
    		</tr>
    	
    		<%int i=0;
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="�󼼺���">inv03</a></td>
    			<td>������</td>
    			<td>170705-180705</td>
    			<td>4��</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0; %>
    	</table>
    		
    <!-- �������̺� -->	
    	<h4>- ����</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>���ڹ�ȣ</th>
				<th>��ǰ�̸�</th>
				<th>���ڱⰣ</th>
				<th>���ڱݾ�</th>
				<th>���ڼ��ͷ�</th>
				<th>����������</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="�󼼺���">inv03</a></td>
    			<td>������</td>
    			<td>170705-180705</td>
    			<td>4��</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>

	<!-- �ݵ����̺� -->	
    	<h4>- �ݵ�</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>���ڹ�ȣ</th>
				<th>��ǰ�̸�</th>
				<th>���ڱⰣ</th>
				<th>���ڱݾ�</th>
				<th>���ڼ��ͷ�</th>
				<th>����������</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="�󼼺���">inv03</a></td>
    			<td>������</td>
    			<td>170705-180705</td>
    			<td>4��</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>
    	
    <!-- ���ݿ��� ���̺� -->	
    	<h4>- ���ݿ���</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>���ڹ�ȣ</th>
				<th>��ǰ�̸�</th>
				<th>���ڱⰣ</th>
				<th>���ڱݾ�</th>
				<th>���ڼ��ͷ�</th>
				<th>����������</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="�󼼺���">inv03</a></td>
    			<td>������</td>
    			<td>170705-180705</td>
    			<td>4��</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>
    		
    <!-- ��Ÿ ���̺� -->	
    	<h4>- ��Ÿ</h4>
    	<table id="productCtmAll">
    		<tr>
    			<th>���ڹ�ȣ</th>
				<th>��ǰ�̸�</th>
				<th>���ڱⰣ</th>
				<th>���ڱݾ�</th>
				<th>���ڼ��ͷ�</th>
				<th>����������</th>
    		</tr>
    	
    		<%
    		while(i<2){ %>
    		<tr>
    			<td><a href="consultCtmInvestView.jsp" title="�󼼺���">inv03</a></td>
    			<td>������</td>
    			<td>170705-180705</td>
    			<td>4��</td>
    			<td>7%</td>
    			<td>18/07/05</td>
    		</tr>    			
    		<%i++;}
    		i=0;%>		
    	</table>
    		
    	<%}//�˻����� if close, ���ǿ� ���� ����~��Ÿ ���%>
    	
    </div>
    
</div>
</body>
</html>