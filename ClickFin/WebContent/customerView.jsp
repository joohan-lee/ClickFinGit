<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userId");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ŭ���� �� �α���.</title>
 <meta charset="UTF-8">

    </div>
</head><font size = "20px" ,style = "text-align:center">Click Fin _ �����</font>

<style>
    body {
    	float:right
        margin:20px auto;
        padding: 0;
        font-family:"���� ���";
        font-size:0.9em;
	}
    ul#navi {
        width: 200px;
        margin: 0;
        padding: 0;
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
	<br>
    <div style = "text-align:right" ><%=id %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp">�α׾ƿ�</a>
    <ul id="navi">
        <li class="group">
            <div class="title">��������</div>
            <ul class="sub">
                <li><a href="mypage.jsp">�� ����</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">��ǰ�� ��Ȳ ����</div>
            <ul class="sub">
                <li><a href="#">���Ի�ǰ ��ü ��Ȳ</a></li>                
                <li><a href="#">��ǰ�� �� ��Ȳ</a></li>
                <li><a href="#">Ÿ��ǰ �� ��Ȳ</a></li>
            </ul>
        </li>       
    </ul>
    <h1>������</h1>
    </div>
</body>
</html>