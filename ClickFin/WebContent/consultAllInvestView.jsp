<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("�߸��� �α���");
		location.href("login.html");
		</script><%
		
	}%>
	<%String searchStr = request.getParameter("searchStr");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ�� ��Ȳ - ����</title>
<link rel="stylesheet" href="navbar.css">

<script src="scripts/jquery-1.6.2.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
#current form {
    width: 500px;
}
table {
    border-collapse:collapse;
    border: 1px gray solid;
    margin-bottom: 10px;
}
th, td, tr{
    border: 1px gray solid;
    padding: 3px 10px;
}
.off-screen {
    display: none;
}
#nav {
    width: 500px;
    text-align: center;
}
#nav a {
    display: inline-block;
    padding: 3px 5px;
    margin-right: 10px;
    font-family:Tahoma;
    background: #ccc;
    color: #000;
    text-decoration: none;
}
#nav a.active {
    background: #333;
    color: #fff;
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
    
<!-- Investing Items' current state View -->
	<div id="content" style="width: 800px;">
		<h2>��ǰ�� ��Ȳ - ����</h2>
		<form action="consultAllInvestView.jsp">
		<select id="searchCond" width="100px">
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
		
		<div>
			<caption style="float:left">
					<form action="consultAllInvestView.jsp" id="setRows">
						<br>
						<select>
							<option value="10" name="rowPerPage">10�ٺ���</option>
							<option value="20" name="rowPerPage">20�ٺ���</option>
							<option value="100" name="rowPerPage">100�ٺ���</option>
						</select>
					</form>
			</caption>
			
			<%if(!"".equals(searchStr)&&searchStr!=null){ %>
			<table class="paginated" width="600px">
				<thead></thead>
				<tbody>
					<table id="products" border="1" style="text-align:center;">

				  		<thead>
							<tr>
   			     		    	<th>����</th>
   			     		    	<th>����</th>
								<th>���ڹ�ȣ</th>
            					<th>��ǰ�̸�</th>
         					    <th>���ڱⰣ</th>
            					<th>���ڱݾ�</th>
            					<th>���ڼ��ͷ�</th>
            					<th>����������</th>
							</tr>
  		 				</thead>
   				
   						<tbody id="investTbody">
							<%for(int i=1;i<=200;i++){%>
							<tr>
								<td><%= i %></td>
								<td><%=searchStr%></td>
								<td>170704</td>
								<td>180704</td>
								<td>100,000,000</td>
								<td>7%</td>
								<td>�赿��</td>
								<td></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
			<%} %>
		</div>
		
		<script>
		//ǥ�� ������ �ʹ� ���� �� ������ ����¡����.
		var $setRows = $('#setRows');

		$setRows.submit(function (e) {
		    e.preventDefault();
		    var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 ��  ���Ͽ� ���ڿ��� �������� ��ȯ

//		      console.log(typeof rowPerPage);

		    var zeroWarning = 'Sorry, but we can\'t display "0" rows page. + \nPlease try again.'
		    if (!rowPerPage) {
		        alert(zeroWarning);
		        return;
		    }
		    $('#nav').remove();
		    var $products = $('#products');
			
		    $products.after('<div id="nav" style="float:center;width:700px">');


		    var $tr = $($products).find('tbody tr');
		    var rowTotals = $tr.length;
		//  console.log(rowTotals);

		    var pageTotal = Math.ceil(rowTotals/ rowPerPage);
		    var i = 0;
		    var j = 0;
		    
		    $('<a href="#"></a>')
		   			.attr('rel', j-1)
		   			.html('back')
		   			.appendTo('#nav')
		    for (; i < pageTotal/10 + 1; i++) {
		    	for(;j<10;j++){
		        $('<a href="#"></a>')
		                .attr('rel', j)
		                .html(j + 1 + i*10)
		                .appendTo('#nav');
		    	}
		    }
		    $('<a href="#"></a>')
				.attr('rel', j+1)
				.html('front')
				.appendTo('#nav')
			
		    $tr.addClass('off-screen')
		            .slice(0, rowPerPage)
		            .removeClass('off-screen');

		    var $pagingLink = $('#nav a');
		    $pagingLink.on('click', function (evt) {
		        evt.preventDefault();
		        var $this = $(this);
		        if ($this.hasClass('active')) {
		            return;
		        }
		        $pagingLink.removeClass('active');
		        $this.addClass('active');

		        // 0 => 0(0*4), 4(0*4+4)
		        // 1 => 4(1*4), 8(1*4+4)
		        // 2 => 8(2*4), 12(2*4+4)
		        // ���� �� = ������ ��ȣ * �������� ���
		        // �� �� = ���� �� + �������� ���

		        var currPage = $this.attr('rel');
		        var startItem = currPage * rowPerPage;
		        var endItem = startItem + rowPerPage;

		        $tr.css('opacity', '0.0')
		                .addClass('off-screen')
		                .slice(startItem, endItem)
		                .removeClass('off-screen')
		                .animate({opacity: 1}, 300);

		    });

		    $pagingLink.filter(':first').addClass('active');

		});


		$setRows.submit();
		
		</script>
		</tbody>
		</table>
	</div>
		
	</div>
	
</div>
</body>
</html>