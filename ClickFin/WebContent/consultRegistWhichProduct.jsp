<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%String searchStr = request.getParameter("searchStr"); 
    session.setAttribute("searchStr",searchStr);%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ��ǰ ���</title>


</head>

<style>
ul li input{
	top-margin:5px;
	bottom-margin:5px;
}
li{
	float:left;
	width:130px;
}

.button {
border:1x solid #ff0080;    /*---�׵θ� ����---*/
background-Color:#14D3FF;   /*--��׶��� ����---*/
font:12px ����;      /*--��Ʈ ����---*/
font-weight:bold;   /*--��Ʈ ����---*/
color:#000010;    /*--��Ʈ ����---*/
width:130;height:30;  /*--��ư ũ��---*/
}
</style>

<body>
<div id="container" style="width:1000px">
	
	<div id="content">
		<h2>��ǰ ����Ͻð��� �ϴ� ������ ���̵� �Է����ֽʽÿ�.</h2>
		<form action="" method="post">
			<input type="text" name="searchStr">
			<input type="submit" value="���̵�Ȯ��" title="�� id�����ϴ��� Ȯ��"
				onclick="//DB����Ȯ��, �����ϸ� existCtm=true;">
		</form>
		
		<%if(!"".equals(searchStr)&&searchStr!=null){//+ �ش� ���̵� DB�� �����ϸ� %>
			<h2><%=searchStr%>������ ����Ͻð��� �ϴ� ��ǰ�� �����Ͻʽÿ�. </h2>
			<ul>
				<li>
					<input type="button" value="���ڵ��" class="button"
						onclick="location.href='consultCtmInvestRegist.jsp'">
				</li>
				<li>
					<input type="button" value="������" class="button"
						onclick="location.href='consultCtmInsuranceRegist.jsp'">
				</li>
				<li>
					<input type="button" value="�ݵ���" class="button"
						onclick="location.href='consultCtmFundRegist.jsp'">
				</li>
				<li>
					<input type="button" value="������" class="button"
						onclick="location.href='consultCtmSavingRegist.jsp'">
				</li>
			</ul>
		<%}%>
		
	
	</div>
	<div style="width:300px">
		<input type="button" value="���" style="margin:10px;float:right"
		onclick="location.href='consultShowAllCustom.jsp'">
	</div>
</div>
</body>
</html>