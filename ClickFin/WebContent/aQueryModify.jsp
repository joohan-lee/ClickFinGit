<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String m_id = null;
	m_id = request.getParameter("id");
	String m_pw = request.getParameter("m_pw");
	String m_addr = request.getParameter("m_addr");
	String m_mail1 = request.getParameter("m_mail1");
	String m_mail2 = request.getParameter("m_mail2");
	String m_num = request.getParameter("m_num");
	String m_mail = m_mail1 + "@" + m_mail2;
	String type = request.getParameter("type");
	String bp = request.getParameter("bp");
	out.println(bp + type + m_mail + m_addr);
%>

<html>

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

try{
	Context init = new InitialContext();
	ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	conn = ds.getConnection();

	String sql = "update users set pw = '" +m_pw +"' ,phone= '" +m_num +"' ,address= '" +m_addr+ "' ,email='"+m_mail+"' where id = '"+m_id+"'";
	stmt = conn.createStatement();
	
	if(m_pw !=null &&m_addr != null &&m_num != null && m_mail1!=null &&m_mail2 != null ){
		if(m_pw == null||m_pw.equals("")) {%>
		 <script>
		 alert('비밀번호를 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(m_pw.length() < 7 || m_pw.length() < 7 ) {%>
		 <script>
		 alert('비밀번호는 7자리 이상이여야 합니다.');
		 history.go(-1);
		</script>
		<%
		}
		else if(m_addr.equals("")) {%>
		 <script>
		 alert('주소를 입력해주세요');
		 history.go(-1);
		</script>
		<%
		}
		else if(m_num.equals("")) {%>
		 <script>
		 alert('전화번호를 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(m_mail1.equals("")||m_mail2.equals("")) {%>
		 <script>
		 alert('메일을 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else{
			rs = stmt.executeQuery(sql);
			%>
			<script>
			alert('수정되었습니다!.'); </script><%
			if(type.equals("con")){
				%>
				<script>
					location.href="aInfoConsultantDetail.jsp?id=<%=m_id%>&bp=<%=bp%>";
				</script><%
			}
			else{
				%>
				<script>
					location.href="aInfoCustomerDetail.jsp?id=<%=m_id%>&bp=<%=bp%>";
				</script><%
			}
		}
		
	}
	else{
		%><script>alert('잘못된 접근입니다.');
		history.go(-1);</script><%	
	}
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