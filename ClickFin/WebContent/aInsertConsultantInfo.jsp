<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>


<%
	String user_id = (String)session.getAttribute("userId");
	if(user_id == null || user_id.equals(""))
	{
		%><script>
			alert("�߸��� �α���");
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ŭ���� - ������ ����</title>
</head>
<body>

	<div style="text-align: center">
		<font size="15">������Ʈ ��Ȳ</font>

	</div>

	<%
	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	ResultSet rs = null;
	Statement stmt = null;
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users";
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
		
		//String insert = "insert into users values('test_hanguel','newpw','����','consultant','11111','010-2323-2323','new_addr','new_user@naver.com')";
		String insert = "insert into users values(')"
				+new_id+"','"
				+new_pw1+"','"
		 		/*"insert into users values('" 
		    	+ new_id +"','"
		    	+ new_pw1 +"','"
		    	+new_name+"',"
		    	+"'consultant'"+",'"
		    	+new_rrn+"','"
		    	+new_num+"','"
		     	+new_addr 
		     	+ ",'')";*/
		
		     	
		
		if(new_id.equals("")||new_id == null) {%>
		 <script>
		 alert('���̵� �Է����ּ���.');
		 history.go(-1);
		</script>
		<%
		}
		else if(chk_id.equals("false") || chk_id.equals("disable") || chk_id == null) {%>
		 <script>
		 alert('���̵� �ߺ�Ȯ���� ���ּ���.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_pw1.equals("") || new_pw2.equals("") || new_pw1 == null || new_pw2 == null) {%>
		 <script>
		 alert('��й�ȣ�� �Է����ּ���.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_addr.equals("")|| new_addr == null) {%>
		 <script>
		 alert('�ּҸ� �Է����ּ���');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_num1.equals("")||new_num2.equals("")||new_num3.equals("")|| new_num1 == null) {%>
		 <script>
		 alert('��ȭ��ȣ�� �Է����ּ���.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_rrn1.equals("")||new_rrn1.equals("")||new_rrn1 == null||new_rrn2 == null) {%>
		 <script>
		 alert('�ֹε�Ϲ�ȣ�� �Է����ּ���.');
		 history.go(-1);
		</script>
		<%
		}
		else if(!new_pw1.equals(new_pw2)) {%>
		 <script>
		 alert('��й�ȣ�� �ٸ��ϴ�.');
		 history.go(-1);
		</script>
		<%
		}
		else if(new_mail1.equals("")||new_mail2.equals("")||new_mail1 == null|| new_mail2 == null) {%>
		 <script>
		 alert('������ �Է����ּ���.');
		 history.go(-1);
		</script>
		<%
		}
		else{
			rs = stmt.executeQuery(insert);		
			%>
			 <script>
			 alert('��ϵǾ����ϴ�.');
			</script>
			<%
			response.sendRedirect("aRegitConsultant.jsp");
		}
		
		
	}catch(Exception e){  // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
			e.printStackTrace();
			out.println("�������");
	}
	%>
	</table>
</body>
</html>