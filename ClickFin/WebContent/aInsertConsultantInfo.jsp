<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<%request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8"); %>



<%
	String user_id = (String)session.getAttribute("userId");
	if(user_id == null || user_id.equals(""))
	{
		%><script>
			alert("잘못된 로그인");
			parent.location.href("login.html");
		</script>
<%
		
	}
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>클릭핀 - 관리자 접속</title>
</head>
<body>

	<div style="text-align: center">
		<font size="15">컨설턴트 등록</font>

	</div>

	<%
	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		
		stmt = conn.createStatement();
		
		String new_id = request.getParameter("ID");
		String new_pw1 = request.getParameter("input_pw1");
		String new_pw2 = request.getParameter("input_pw2");
		String new_name = request.getParameter("input_name");
		String new_addr= request.getParameter("input_addr");
		String new_num1 = request.getParameter("input_phonenum1");
		String new_num2 = request.getParameter("input_phonenum2");
		String new_num3 = request.getParameter("input_phonenum3");
		String new_rrn1 = request.getParameter("input_rrn1");
		String new_rrn2 = request.getParameter("input_rrn2");
		String chk_id = request.getParameter("checked_id");
		String new_mail1 = request.getParameter("input_mail1");
		String new_mail2 = request.getParameter("input_mail2");
		
		String new_num = new_num1 + new_num2 + new_num3;
		String new_rrn = new_rrn1 + new_rrn2;
		String new_mail = new_mail1 + "@" + new_mail2;
		String new_role = "consultant";
	
		out.println(new_name+"\n");		
		out.println(chk_id+"\n");

	
		
		String values = "'"+new_id+"','"+new_pw1+"','"+new_name+"','"+new_role+"','"+new_rrn+"','"+new_num+"','"+new_addr+"','"+new_mail+"'";
		String insert = "insert into users values("+values+")";
		//String insert ="insert into users values('hello','pw','hell','consultant','920121','01010','seoul','abc@mail.com')";
		
		
		if(new_id.equals("")||new_id == null) {%>
		 <script>
		 alert('아이디를 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(!chk_id.equals("true")) {%>
		 <script>
		 alert('아이디 중복확인을 해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_pw1.equals("") || new_pw2.equals("") || new_pw1 == null || new_pw2 == null) {%>
		 <script>
		 alert('비밀번호를 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_addr.equals("")|| new_addr == null) {%>
		 <script>
		 alert('주소를 입력해주세요');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_num1.equals("")||new_num2.equals("")||new_num3.equals("")|| new_num1 == null) {%>
		 <script>
		 alert('전화번호를 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_rrn1.equals("")||new_rrn1.equals("")||new_rrn1 == null||new_rrn2 == null) {%>
		 <script>
		 alert('주민등록번호를 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else if(!new_pw1.equals(new_pw2)) {%>
		 <script>
		 alert('비밀번호가 다릅니다.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_mail1.equals("")||new_mail2.equals("")||new_mail1 == null|| new_mail2 == null) {%>
		 <script>
		 alert('메일을 입력해주세요.');
		 history.go(-1);
		</script>
		<%
		}
		else{
			rs = stmt.executeQuery(insert);		
			%>
			 <script>
			 alert('등록되었습니다.');
			</script>
			<%
			response.sendRedirect("aRegitConsultant.jsp");
		}
		rs.close();
		stmt.close();
		conn.close();	
	}catch(Exception e){  // 예외가 발생하면 예외 상황을 처리한다.
		%><script>
		 alert('DB오류');
		</script><%
			e.printStackTrace();
			%><script> history.go(-1);</script><%
	}
	%>
</body>
</html>