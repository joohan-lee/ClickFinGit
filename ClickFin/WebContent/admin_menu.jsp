<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
            <div class="title">ȸ�� ���</div>
            <ul class="sub">
                <li><a href="#">������ ���</a></li>
                <li><a href="#">������Ʈ ���</a></li>
                <li><a href="#">�� ���</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">������Ʈ ��Ȳ</div>
            <ul class="sub">
                <li><a href="#">��ü ��Ȳ</a></li>
                <li><a href="#">���κ� ��Ȳ</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">�� ��Ȳ </div>
            <ul class="sub">
                <li><a href="#">��ü ��Ȳ</a></li>
                <li><a href="#">���κ� ��Ȳ</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">��ǰ�� ���</div>
            <ul class="sub">
                <li><a href="#">������Ʈ�� ���</a></li>                
                <li><a href="#">���� ���</a></li>
                <li><a href="#">��ü ���� ��ǰ ��</a></li>
                <li><a href="#">��ü ���� �ݾ�</a></li> 
            </ul>
        </li>          
    </ul>
</body>
</html>