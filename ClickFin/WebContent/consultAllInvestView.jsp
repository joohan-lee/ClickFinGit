<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>alert("잘못된 로그인");
		location.href("login.html");
		</script>
<%
		
	}%>

<%!int numOfProduct=1;%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품별 현황 - 투자</title>
<link rel="stylesheet" href="navbar.css">

<script src="scripts/jquery-1.6.2.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<font size="20px" ,style="text-align: center">Click Fin _ 컨설턴트모드</font>

<style>
#current form {
	width: 500px;
}

table {
	border-collapse: collapse;
	border: 1px gray solid;
	margin-bottom: 10px;
}

th, td, tr {
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
	font-family: Tahoma;
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
	<div style="text-align: right"><%=userId %>님 환영합니다.<br> <a
			href="logout.jsp">로그아웃</a>
	</div>
	<!-- navigator -->
	<div id="container" style="width: 1000px;">
		<div id="menu" style="width: 200px; float: left;">
			<ul id="navi">
				<li class="group">
					<div class="title">컨설턴트</div>
					<ul class="sub">
						<li><a href="consultMyInfoView.jsp">개인정보</a></li>
					</ul>
				</li>
				<li class="group">
					<div class="title">고객관리</div>
					<ul class="sub">
						<li><a href="consultShowAllCustom.jsp">고객 전체 현황</a></li>
						<li><a href="consultCtmInfoView.jsp">고객별 개인정보</a></li>
						<li><a href="#">고객별 가입상품현황</a></li>
					</ul>
				</li>
				<li class="group">
					<div class="title">상품별 현황</div>
					<ul class="sub">
						<li><a href="consultAllInvestView.jsp">투자</a></li>
						<li><a href="#">보험</a></li>
						<li><a href="#">펀드</a></li>
						<li><a href="#">적금 예금</a></li>
						<li><a href="#">기타</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<!-- Investing Items' current state View -->
		<div id="content" style="width: 800px;">
			<h2>상품별 현황 - 투자</h2>
			<form action="consultAllInvestView.jsp">
				<select id="searchCond" width="100px">
					<option value="전체">-전체-</option>
					<option value="이름">이름</option>
					<option value="연락처">연락처</option>
				</select>

				<!-- 선택된 select메뉴 -->
				<script type="text/javascript">
   			 function CheckSelect(){
       		 	var ctrlSelect = document.getElementById("searchCond");
        		if( ctrlSelect.selectedIndex == 0){
            	//alert("관심사항을 선택하시오.");
        		    ctrlSelect.focus();
       			 }else{
            		//window.alert("당신의 관심사항 : " + ctrlSelect.value );
       			 }
   			 }
 		 </script>

				<input type="text" name="searchStr" style="width: 300px"> <input
					type="submit" value="검색" onclick="CheckSelect();")>

			</form>

			<div id="currentState">
				<caption style="float: left">
					<form action="consultAllInvestView.jsp" id="setRows">
						<br> <select>
							<option value="10" name="rowPerPage">10줄보기</option>
							<option value="20" name="rowPerPage">20줄보기</option>
							<option value="100" name="rowPerPage">100줄보기</option>
						</select>
					</form>
				</caption>

<%
   Connection conn = null;                                      
   ResultSet rs1 = null;   
   ResultSet rs2 = null; 
   ResultSet rs3 = null;
   DataSource ds;
   try{
      Context init = new InitialContext();
      ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
      conn = ds.getConnection();
      Statement stmt1 = conn.createStatement();
      Statement stmt2 = conn.createStatement();
      Statement stmt3 = conn.createStatement();
      %>
				<table class="paginated" width="600px">
					<thead></thead>
					<tbody>
						<table id="products" border="1" style="text-align: center;">

							<thead>
								<tr>
									<th>순번</th>
									<th>상품명</th>
									<th>투자기간</th>
									<th>투자금액</th>
									<th>투자수익률</th>
									<th>가입자</th>
								</tr>
							</thead>

							<tbody id="investTbody">
								<%
         rs1 = stmt1.executeQuery("SELECT id, name FROM users WHERE id IN ("+
                 "SELECT id FROM customer WHERE consul_id = '"+ userId  +"')");
         int i=0;
         while(rs1.next()) {
            i++;
            String cusId = rs1.getString("id");
            String cusName = rs1.getString("name");
            rs2 = stmt2.executeQuery("SELECT * FROM invest where user_id = '" +cusId +"'" );
           while(rs2.next()){
            String ivName = rs2.getString("name");
            String period = rs2.getString("period");
            String money = rs2.getString("money");
            String day = rs2.getString("day");
            String id = rs2.getString("user_Id");
            rs3 = stmt3.executeQuery("select rate from invest_product where name = '" + ivName + "'");
            rs3.next();
            String rate = rs3.getString("rate");
      
        
            out.println("<tr>");
            out.println("<td>" + i + "</td>");
            out.println("<td>" + ivName + "</td>");
            out.println("<td>" + period + "</td>");
            out.println("<td>" + money + "</td>");
            out.println("<td>" + rate + "</td>");
            out.println("<td>" + cusName + "</td>");
            out.println("</tr>");
            
            }
         }
           %>
							</tbody>
						</table>
<%
   } catch(Exception e){
      e.printStackTrace();
      out.println("연결실패");
   }
    %>
						</div>

						<script>
		//표의 내용이 너무 많을 때 나누어 페이징해줌.
		var $setRows = $('#setRows');

		$setRows.submit(function (e) {
		    e.preventDefault();
		    var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

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
		        // 시작 행 = 페이지 번호 * 페이지당 행수
		        // 끝 행 = 시작 행 + 페이지당 행수

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