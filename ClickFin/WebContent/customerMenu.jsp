<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
	String user_id = (String)session.getAttribute("userID");
	if(user_id == null || user_id.equals(""))
	{
		%><script>alert("잘못된 로그인");
		parent.location.href("login.html");
		</script><%
		
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
    body {
    	float:right
        margin:20px auto;
        padding: 0;
        font-family:"맑은 고딕";
        font-size:0.9em;
	}
    ul#navi {
        width: 200px;
        text-indent: 10px;
	}
    ul#navi, ul#navi ul {
        margin:0;
        padding:0;
        list-style:none;
	}
    li.group {
        margin-bottom: 3px;
	}
    li.group div.title {
        height: 35px;
        line-height: 35px;
        background:#f4f4f4;
        cursor:pointer;
	}
    ul.sub li {
        margin-bottom: 2px;
        height:35px;
        line-height:35px;
        background:#ffffff;
        cursor:pointer;
	}
    ul.sub li a {
        display: block;
        width: 100%;
        height:100%;
        text-decoration:none;
        color:#000;
	}
    ul.sub li:hover {
        background:#f4f4f4;
	}
</style>

<body>
    <ul id="navi">
        <li class="group">
            <div class="title">개인정보</div>
            <ul class="sub">
                <li><a href="customerMyInfo.jsp" target ="body">내 정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">상품별 현황 보기</div>
            <ul class="sub">
                <li><a href="customerMyProductAll.jsp" target = "body">가입상품 전체 현황</a></li>                
                <li><a href="#">상품별 상세 현황</a></li>
                <li><a href="#">타상품 상세 현황</a></li>
            </ul>
        </li>       
    </ul>
    </div>
</body>
</html>