<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userID");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML> 	
<HEAD><TITLE>클릭핀 관리자 모드 </TITLE> 
</HEAD> 
<FRAMESET ROWS="17%, 1*" border="0"> 
<FRAME SRC="adminHead.jsp" NAME="head" scrolling="no"
 marginwidth="0" marginheight="0">
<FRAMESET COLS="20%,80%"><FRAME SRC="adminMenu.jsp"NAME="menu"
 scrolling="auto" marginwidth="0" marginheight="0">
<FRAME SRC="adminMain.jsp" NAME="body" scrolling="auto" 
marginwidth="0" marginheight="0">
</FRAMESET>
  <noframes>
  <p>&nbsp;</p>
  </noframes>
</frameset>
</html> 