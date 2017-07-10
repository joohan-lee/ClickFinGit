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
		new_url= "aInfoCustomerSearch.jsp?data="+get_data+"&type="+selected;
		window.location.href = encodeURI(new_url);
	}
}

<%
	int count = 0;
	String input_data = request.getParameter("data");
	String input_type = request.getParameter("type");
	String id1 = null;
	String rrn = null;
	String show_rrn = null;
	String name = null;
	String num = null;
%>

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 - 관리자 접속</title>
</head>
<body>
<br><br>
<form name = "search_form">
<div style = "text-align:center">고객 검색 : <input type = "text" maxlength = "15" id = "search_data" name = "search_data">
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
			String sql = "select * from users where role = 'customer'";
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
						<font size=3>주민등록번호</font>
					</div></td>
				<td width="100"><div style="text-align: center">
						<font size=3>  </font>
					</div></td>
				
			</tr>
			<%
	   		while(rs.next())
	   	   	{
	   			id1 = rs.getString("id");
	   			name = rs.getString("name");
				rrn = rs.getString("rrn");
				num = rs.getString("phone");
				if(rrn.length() != 13){
					show_rrn = " ";
				}
				else{
					show_rrn= rrn.substring(0,6) + "- *******";
				}
				
	   			
	   			if(input_type != null && input_data != null){
	   				
	   				if(input_type.equals("search_by_id")){
		   				if(id1.contains(input_data)){	
		   					count ++;
		   		   	   		%>
		   				<tr>
		   					<td width="100"><div style="text-align: center"><%=name%></div></td>
		   					<td width="100"><div style="text-align: center"><%=id1%></div></td>
		   					<td width="100"><div style="text-align: center"><%=show_rrn %></div>
		   					<td width="100"><div style="text-align: center">
		   					<a href = "aInfoCustomerDetail.jsp?id=<%=id1%>&back=search">정보보기</a>
		   					</div>
		   				</tr>
		   				<%	
		   				}   	   		
					}
		   			else if(input_type.equals("search_by_name")){
		   				if(name.contains(input_data)){	
		   					count ++;
		   		   	   		%>
		   				<tr>
		   					<td width="100"><div style="text-align: center"><%=name%></div></td>
		   					<td width="100"><div style="text-align: center"><%=id1%></div></td>
		   					<td width="100"><div style="text-align: center"><%=show_rrn %></div>
		   					<td width="100"><div style="text-align: center">
		   					<a href = "aInfoCustomerDetail.jsp?id=<%=id1%>&back=search">정보보기</a>
		   					</div>
		   				</tr>
		   				<%	
		   				}   
		   			}
		   			else if(input_type.equals("search_by_num")&&num!=null){
		   				if(num.contains(input_data)){	
		   					count ++;
		   		   	   		%>
						<tr>
		   					<td width="100"><div style="text-align: center"><%=name%></div></td>
		   					<td width="100"><div style="text-align: center"><%=id1%></div></td>
		   					<td width="100"><div style="text-align: center"><%=show_rrn %></div>
		   					<td width="100"><div style="text-align: center">
		   					<a href = "aInfoCustomerDetail.jsp?id=<%=id1%>&back=search">정보보기</a>
		   					</div>
		   				</tr>
		   				<%	
		   				}
		   	   		}
	   			}
	   			
	   	   	}
			if(input_data != null && input_type != null){
				if(count == 0){
	   				%><script>alert('검색결과가 없습니다.');</script><%
	   				count = 0;
	   			}
			}
			%></table><%
			rs.close();
			stmt.close();
			conn.close();
	   }catch(Exception e)
	   {
	   	//out.println("ERROR");
	   	e.printStackTrace();
	   }
	%>
</body>
</html>