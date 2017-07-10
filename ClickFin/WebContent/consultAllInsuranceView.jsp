<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<% String userId = "";
	userId = (String)session.getAttribute("userId");
	if(userId == null || userId.equals(""))
	{
		%><script>//alert("잘못된 로그인");
		//location.href("login.html");
		</script><%
		
	}%>
	<%String searchStr = request.getParameter("searchStr");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품별 현황 - 보험</title>
<link rel="stylesheet" href="navbar.css">

<script src="scripts/jquery-1.6.2.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ 컨설턴트모드</font>

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
    <div style = "text-align:right" ><%=userId %>님 환영합니다.<br>
    <a href ="logout.jsp" >로그아웃</a></div>
<!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;float:left;">
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
                <li><a href="consultCtmProductAll.jsp">고객별 가입상품현황</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">상품별 현황</div>
            <ul class="sub">
                <li><a href="consultAllInvestView.jsp">투자</a></li>                
                <li><a href="consultAllInsuranceView.jsp">보험</a></li>
                <li><a href="consultAllFundView.jsp">펀드</a></li>
                <li><a href="consultAllSavingView.jsp">적금 예금</a></li>
            </ul>
        </li>          
    </ul>
    </div>
    
<!-- Investing Items' current state View -->
	<div id="content" style="width: 800px;">
		<h2>상품별 현황 - 보험</h2>
		<form action="consultAllFundView.jsp">
		<select id="searchCond" width="100px">
			<option value="전체">-전체-</option>
			<option value="이름">이름</option>
		</select>
		
		<input type="text" name="searchStr" style="width:300px">
		<input type="submit" value="검색" onclick="CheckSelect();")>
		
		</form>
		
		<div>
				<caption style="float:left">
					<form action="consultAllFundView.jsp" id="setRows">
						<br>
						<select>
							<option value="10" name="rowPerPage">10줄보기</option>
							<option value="20" name="rowPerPage">20줄보기</option>
							<option value="100" name="rowPerPage">100줄보기</option>
						</select>
					</form>
				</caption>
				
			<table class="paginated" width="600px">
				<thead>
				
				</thead>
				<tbody>
					<table id="products" border="1" style="text-align:center;">

				  		<thead>
							<tr>
   			     		    	<th>순번</th>
								<th>상품명</th>
								<th>계약일자</th>
								<th>판매사</th>
								<th>보험료</th>
								<th>보장기간</th>
								<th>보장내역</th>
								<th>가입자</th>
							</tr>
  		 				</thead>
   				
   						<tbody id="investTbody">
							<%for(int i=1;i<=100;i++){%>
							<tr>
								<td><%= i %></td>
								<td>상품명</td>
								<td>170704</td>
								<td>180704</td>
								<td>10억</td>
								<td>7%</td>
								<td>김동현</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>		
		
		</tbody>
		</table>
	</div>
		
	</div>
	
</div>
</body>

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
		    
		    
		    for(;i<pageTotal;i++){
		       $('<a href="#"></a>')
		               .attr('rel', i)
		               .html(i+1)
		               .appendTo('#nav');
	    	}
		    
			
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
</html>