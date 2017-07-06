<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = "";
	id = (String)session.getAttribute("userId");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<HTML> 
<HEAD><TITLE>Å¬¸¯ÇÉ °í°´ ¸ðµå </TITLE> 
</HEAD> 
<FRAMESET ROWS="17%, 1*" border="0"> 
<FRAME SRC="customerMenu.jsp" NAME="menu" scrolling="no"
 marginwidth="0" marginheight="0">

<FRAME SRC="customerMain.jsp" NAME="body" scrolling="auto" 
marginwidth="0" marginheight="0">
</FRAMESET>
  <noframes>
  <p>&nbsp;</p>
  </noframes>
</frameset>
</html> 