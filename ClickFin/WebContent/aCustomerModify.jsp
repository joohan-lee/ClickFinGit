<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String get_id = null;
	get_id = request.getParameter("id");
	String bp = request.getParameter("bp");
%>

<html>
<script>
function numkeyCheck(e){ 
	var keyValue = event.keyCode; 
	if( ((keyValue >= 48) && (keyValue <= 57)) ) 
		return true; 
	else 
		return false; 
	}
</script>
<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
<body>
<% 
Connection conn = null;                                        // null로 초기화 한다.
ResultSet rs = null;
Statement stmt = null;
DataSource ds;
String m_id = null;
String m_rrn = null;
String m_email = null;
String m_num = null;
String m_name = null;
String m_addr = null;
String m_pw = null;
String mSplit_mail[] = new String[2];
try{
	Context init = new InitialContext();
	ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	conn = ds.getConnection();
	String sql = "select * from users where id ='"+get_id+"'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	if(get_id == null){
		%><script>
			alert('잘못된 접근입니다.');
			history.go(-1);
		</script><%
	}
	else{		
		while(rs.next()){
			m_id = rs.getString("id");
			m_name = rs.getString("name");
			m_rrn = rs.getString("rrn");
			m_num = rs.getString("phone");
			m_email = rs.getString("email");
			m_addr = rs.getString("address");
			m_pw = rs.getString("pw");
			mSplit_mail = m_email.split("@");
			//dumpArray(mSplit_mail);
		}%>
		<form method = "post" action = "aQueryModify.jsp?id=<%=m_id%>&bp=<%=bp%>&type=cus" name = "modify_form" id = "modify_form">
		<table width="700" border="1"
				style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;">
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>아이디</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=m_id %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>비밀번호</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><input type = "password" value = <%=m_pw %> id = "m_pw" name = "m_pw"></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>이름</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=m_name %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="20%"><div style="text-align: center">
							<font size=3>주민등록번호</font>
						</div></td>
					<td width="80%"><div style="text-align: center">
							<font size=3><%=m_rrn %></font>
						</div></td>	
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">주소</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="50" name="m_addr" id = "m_addr" value = "<%=m_addr%>">
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">이메일</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="15" maxlength = "15" name="m_mail1" id = "m_mail1" value = "<%=mSplit_mail[0]%>">
							@ <input type = "text" size = "15" maxlength ="15" name = "m_mail2" id = "m_mail2" value = "<%=mSplit_mail[1]%>"> 
						</div></td>
				</tr>
				<tr>
					<td width="30%"><div style="text-align: center">전화번호</div></td>
					<td width="70%"><div style="text-align: center">
							<input type="text" size="13" maxlength="13" id = "m_num"
							style='ime-mode:disabled' onKeyPress="return numkeyCheck(event)" name = "m_num" value = "<%=m_num%>">
						</div></td>
				</tr>
				
		</table>
		
		<br>
		
		<div style = "text-align:center">
		<input type = "button" value = "뒤로가기" onclick = "javascript:history.back()">&nbsp;
		<input type = "submit" value = "변경"></div>
		</form>
	<%}
	rs.close();
	stmt.close();
	conn.close();
	}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
		out.println("연결실패");
	}
	%>
	
</body>
</head>
<body>
</body>
</html>