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

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>클릭핀 - 관리자 접속</title>
</head>
<body>
	<div style="text-align: center">
		<font size="6em">컨설턴트 현황</font>
	</div>

	<%
	Connection conn = null;                                        // null로 초기화 한다.
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs_invest = null;
	ResultSet rs_saving = null;
	ResultSet rs_fund = null;
	ResultSet rs_insurance = null;
	Statement stmt = null;
	DataSource ds;
	
	String id1 = null;
	String name = null;
	String rrn = null;
	String show_rrn = null;
	String num = null;
	String chk_id = null;
	int count_cus = 0;
	int count_invest = 0;
	int count_saving = 0;
	int count_fund = 0;
	int count_insurance = 0;
	
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		String sql = "select * from users where role = 'consultant'";
		
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
   		%>

<body>

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
					<font size=3>관리중인 고객 수</font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3> 펀드 </font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3> 예금  </font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3> 투자 </font>
				</div></td>
			<td width="100"><div style="text-align: center">
					<font size=3> 보험 </font>
				</div></td>
		</tr>
		<%
   		while(rs.next())
   	   	{
   			id1 = rs.getString("id");
   			name = rs.getString("name");
   			rrn = rs.getString("rrn");
   			num = rs.getString("phone");
   			String consul_id = null;
   			if(rrn.length() != 13){
				show_rrn = " ";
			}
			else{
				show_rrn= rrn.substring(0,6) + "- *******";
			}
   			count_cus = 0;
   			String sql_invest = "select * from invest";
   			String sql_insurance = "select * from insurance";
   			String sql_saving = "select * from saving";
   			String sql_fund = "select * from fund";
   			String sql_cus = "select * from customer";
   			rs1 = stmt.executeQuery(sql_cus);
			while(rs1.next()){
					chk_id = rs1.getString("consul_id");
					
					if(chk_id.equals(id1)){
						count_cus ++;
						rs_invest = stmt.executeQuery(sql_invest);
						while(rs_invest.next()){
							String get_user_id = rs_invest.getString("user_id");
							if(get_user_id.equals(chk_id)){
								count_invest ++;
							}
						}
						rs_insurance = stmt.executeQuery(sql_insurance);
						while(rs_insurance.next()){
							String get_user_id = rs_insurance.getString("user_id");
							if(get_user_id.equals(chk_id)){
								count_insurance ++;
							}
						}
						rs_saving = stmt.executeQuery(sql_saving);
						while(rs_saving.next()){
							String get_user_id = rs_saving.getString("user_id");
							if(get_user_id.equals("chk_id")){
								count_saving ++;
							}
						}
						rs_fund = stmt.executeQuery(sql_fund);
						while(rs_fund.next()){
							String get_user_id = rs_fund.getString("user_id");
							if(get_user_id.equals("chk_id")){
								count_fund ++;
							}
						}
					}
			}
   	   		%> 	   		
		<tr>

			<td width="100"><div style="text-align: center"><%= name %></div></td>
			<td width="100"><div style="text-align: center"><%= id1 %></div></td>
			<td width="100"><div style="text-align: center"><%=count_cus %></div></td>
			<td width="100"><div style="text-align: center"><%=count_fund %></div></td>
			<td width="100"><div style="text-align: center"><%=count_saving %></div></td>
			<td width="100"><div style="text-align: center"><%=count_invest %></div></td>
			<td width="100"><div style="text-align: center"><%=count_insurance %></div></td>
		</tr>			
		<%
   	   	}
		rs.close();
		stmt.close();
		conn.close();
   	
   }catch(Exception e){
   		out.println("ERROR");
   		e.printStackTrace();
   }
%>
	</table>
</body>
</html>