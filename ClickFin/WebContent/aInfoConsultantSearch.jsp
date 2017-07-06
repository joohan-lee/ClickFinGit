<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
td, tr, th {
	border: 1px gray solid;
	text-align: center;
}
</style>


<script>
function search(){
	var checked = document.getElementsByName('search_type');
	var selected = null;
	

	var get_data = document.search_form.search_data.value;
	var new_url = null;
	for(var i = 0; i <checked.length;i++){
		if(checked[i].checked == true){
			selected = checked[i].value;
		}
	}
	if(selected == null){
		alert('검색 방법을 체크해주세요.');
	}
	else if(get_data==""||get_data ==null){
		alert('검색 내용을 입력해주세요.');
	}
	else{
		new_url= "aInfoConsultantSearch.jsp?data="+get_data+"&type="+selected;
		window.location.href = encodeURI(new_url);
	}
}

<%
	String input_data = request.getParameter("data");
	String input_type = request.getParameter("type");
%>

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 - 관리자 접속</title>
</head>
<body>
<br><br>
<form name = "search_form">
<div style = "text-align:center">검색 : <input type = "text" maxlength = "15" id = "search_data" name = "search_data">
<input type = "button" value = "검색" name = "search_start" onclick = "search()">
&nbsp; 아이디 검색<input type = "radio" name = "search_type" value = "search_by_id">
&nbsp; 이름 검색<input type = "radio" name = "search_type" value = "search_by_name">
&nbsp; 번호 검색<input type = "radio" name = "search_type" value = "search_by_num">
</div>
</form>

 
 
 <%
		Connection conn = null;                                        // null로 초기화 한다.
		ResultSet rs = null;
		Statement stmt = null;
		DataSource ds;
		try{
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			conn = ds.getConnection();
			String sql = "select * from users";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
	   	
	   	//ResultSet get_type = st.executeQuery(get_type_Query);
	   		%>
		<br>
		<br>
		<table width="700" border="1"
			style="border-collapse: collapse; border: 1px gray solid; margin-top: 20px; margin-left: auto; margin-right: auto;">
			<tr>
				<td width="100"><div style="text-align: center">
						<font size=3>이름</font>
					</div></td>
				<td width="100"><div style="text-align: center">
						<font size=3>ID</font>
					</div></td>
				<td width="100"><div style="text-align: center">
						<font size=3>관리 고객 수</font>
					</div></td>
			</tr>
			<%
	   		while(rs.next())
	   	   	{
	   			String id1 = rs.getString("id");
	   			String name = rs.getString("name");
	   			String role = rs.getString("role");
	   			String num = rs.getString("phone");
	   			String get_data = request.getParameter("data");
	   			if(input_type.equals("search_by_id")){
	   				if(role.equals("consultant") && id1.contains(input_data)){	
	   		   	   		%>
	   				<tr>
	   					<td width="100"><div style="text-align: center"><%=name%></div></td>
	   					<td width="100"><div style="text-align: center"><%=id1%></div></td>
	   					<td width="100"><div style="text-align: cente"></div>
	   				</tr>
	   				<%	
	   				}   	   		
				}
	   			else if(input_type.equals("search_by_name")){
	   				if(role.equals("consultant") && name.contains(input_data)){	
	   		   	   		%>

	   				<tr>
	   					<td width="100"><div style="text-align: center"><%=name%></div></td>
	   					<td width="100"><div style="text-align: center"><%=id1%></div></td>
	   					<td width="100"><div style="text-align: cente"></div>
	   				</tr>
	   				<%	
	   				}   
	   			}
	   			else if(input_type.equals("search_by_num")){
	   				if(role.equals("consultant") && num.contains(input_data)){	
	   		   	   		%>

	   				<tr>
	   					<td width="100"><div style="text-align: center"><%=name%></div></td>
	   					<td width="100"><div style="text-align: center"><%=id1%></div></td>
	   					<td width="100"><div style="text-align: cente"></div>
	   				</tr>
	   				<%	
	   				}
	   	   		}
	   	   	}
			%></table><%
	   }catch(Exception e)
	   {
	   	//out.println("ERROR");
	   	e.printStackTrace();
	   }
	%>
</body>
</html>