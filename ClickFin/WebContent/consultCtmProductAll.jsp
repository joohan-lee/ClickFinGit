<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   String userId = "";
   userId = (String)session.getAttribute("userId");
   if(userId == null || userId.equals(""))
   {
      %><script>alert("�߸��� �α���");
      location.href("login.html");
      </script><%
      
   }%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ���� ���Ի�ǰ ��Ȳ</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
table{
   border-collapse:collapse;
   border: 1px gray solid;
}
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
#productCtmAll{
   width:600px
}
html{
   height:100%;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp" >�α׾ƿ�</a></div>
    
    
    <!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;height:1000px;float:left;">
    <ul id="navi">
        <li class="group">
            <div class="title">������Ʈ</div>
            <ul class="sub">
                <li><a href="consultMyInfoView.jsp">��������</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">������</div>
            <ul class="sub">
                <li><a href="consultShowAllCustom.jsp">�� ��ü ��Ȳ</a></li>
                <li><a href="consultCtmInfoView.jsp">���� ��������</a></li>
                <li><a href="consultCtmProductAll.jsp">���� ���Ի�ǰ��Ȳ</a></li>                   
            </ul>
        </li>
        <li class="group">
            <div class="title">��ǰ�� ��ü ��Ȳ</div>
            <ul class="sub">
                <li><a href="consultAllInvestView.jsp">����</a></li>                
                <li><a href="#">����</a></li>
                <li><a href="#">�ݵ�</a></li>
                <li><a href="#">���� ����</a></li>
                <li><a href="#">��Ÿ</a></li> 
            </ul>
        </li>          
    </ul>
    </div>
    
<!-- ���� -->
    <div id="content" style="width: 800px">
       <h2>������ - ���� ���Ի�ǰ��Ȳ</h2>
   <!-- �˻� -->
      <form action="">
      
         <select id="searchCond" style="width:100px;">
            <option value="�� ���̵�">�� ���̵�</option>
         </select>
      
         
         <input type="text" name="searchStr" style="width:300px">
         <input type="submit" value="�˻�" onclick="CheckSelect();")>
      
      </form>
      
      <%String searchStr = "";
      searchStr = request.getParameter("searchStr"); %>
      
      
   <!-- �ش� �� ��ǰ ��ü ��� -->
       <%

	Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
	ResultSet rs1 = null;	//������� id, �̸�, �������, ��ȣ, �ּ�, �̸����ּҸ� �������� ���� resultset
	ResultSet rs2 = null;	//������Ʈ�� �̸�, ��ȣ, �̸����ּҸ� �������� ���� resultset
	DataSource ds;
	try{
		Context init = new InitialContext();
		ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();
		
      if(!"".equals(searchStr)&&searchStr!=null){
         //DB�� �������� �ʾƵ� ��µ��� �ʵ��� �ٲٱ� or �����ؾ� ����ϴ� �ŷ� �ٲٱ�%>
       <h3 style="text-align:center"><%=searchStr%> ���� ��ǰ ��� </h3>
    <!-- �������̺� -->   	
    <% 	
		//query = "ALTER TABLE users ADD (phone varchar(13))";
		//query = "ALTER TABLE users ADD (address varchar(50), email varchar(30))";

		
		//����--------------------------------------
		
		rs1 = stmt.executeQuery("SELECT * FROM invest WHERE user_id = '"+ searchStr  +"'");
		%>
       <h4>- ����</h4>
       <table id="productCtmAll">
          <tr>
             <th>���ڹ�ȣ</th>
            <th>��ǰ�̸�</th>
            <th>���ڱⰣ</th>
            <th>���ڱݾ�</th>
            <th>���ڼ��ͷ�</th>
            <th>����������</th>
          </tr>
       
        <%
		while(rs1.next()){
			//String getID = rs1.getString("user_id");
			//if(id.equals(getID)) {
				String invId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String money = rs1.getString("money");
				String day = rs1.getString("day");

				rs2 = stmt.executeQuery("select rate from invest_product where name ='"+ name +"'");
				rs2.next();
				String rate = rs2.getString("rate");
				out.println("<tr>");
				%><td><a href="consultCtmInvestView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(invId);
				session.setAttribute("invId", invId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + rate + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("</tr>");
			}
			
			
		//}
		%>
       </table>
          
    <!-- �������̺� -->   
   <% rs1 = stmt.executeQuery("SELECT * FROM insurance WHERE user_id = '"+ searchStr  +"'"); %>
    
       <h4>- ����</h4>
       <table id="productCtmAll">
          <tr>
             <th>�����ȣ</th>
            <th>��ǰ�̸�</th>
            <th>���ԱⰣ</th>
            <th>ȸ��</th>
            <th>�����</th>
            <th>����Ⱓ</th>
            <th>���峻��</th>
          </tr>
       
        <%
		while(rs1.next()){
			
			//String getID = rs1.getString("user_id");
			//if(id.equals(getID)) {
				String insId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");

				rs2 = stmt2.executeQuery("select company, fee, period, ensure from insurance_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String fee = rs2.getString("fee");
				String insPeriod = rs2.getString("period");
				String ensure = rs2.getString("ensure");
				
				out.println("<tr>");
				%><td><a href="onsultCtmInsuranceView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(insId);
				session.setAttribute("insId", insId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("<td>" + fee + "</td>");
				out.println("<td>" + insPeriod + "</td>");
				out.println("<td>" + ensure + "</td>");
				out.println("</tr>");
			}
	//	}
		%>      
       </table>

   <!-- �ݵ����̺� -->   
   <% rs1 = stmt.executeQuery("SELECT * FROM fund WHERE user_id = '"+ searchStr  +"'"); %>
       <h4>- �ݵ�</h4>
       <table id="productCtmAll">
          <tr>
             <th>�ݵ��ȣ</th>
            <th>��ǰ�̸�</th>
            <th>������</th>
            <th>������</th>
            <th>��ġ�ݾ�</th>
            <th>ȸ��</th>
            <th>����</th>
          </tr>
       
       <%
		while(rs1.next()){
			
			//String getID = rs1.getString("user_id");
			//if(id.equals(getID)) {
				String funId = rs1.getString("id");
				String name = rs1.getString("name");
				String day = rs1.getString("day");
				String month = rs1.getString("month");
				String money = rs1.getString("money");
				
				rs2 = stmt2.executeQuery("select company, type from fund_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				String type = rs2.getString("type");
				
				out.println("<tr>");
				%><td><a href="onsultCtmFundView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(funId);
				session.setAttribute("funId", funId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + day + "</td>");
				out.println("<td>" + month + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("<td>" + type + "</td>");
				out.println("</tr>");
			}
	//	}
		%></tbody></table><br><%

		//����(����/����)---------------------------------------------------------------------
		
		rs1 = stmt.executeQuery("SELECT * FROM saving WHERE user_id = '"+ searchStr  +"'");
		%>
		<h4>- ����</h4>
       <table id="productCtmAll">
       <table>
	    <thead>
			<th>�����ȣ</th>
			<th>��ǰ�̸�</th>
			<th>���ԱⰣ</th>
			<th>������</th>
			<th>���ݾ�</th>
			<th>ȸ��</th>
		</thead>
		<tbody id="customTbody">
		<%
		while(rs1.next()){
			
			//String getID = rs1.getString("user_id");
		//	if(id.equals(getID)) {
				String savId = rs1.getString("id");
				String name = rs1.getString("name");
				String period = rs1.getString("period");
				String month = rs1.getString("month");
				String money = rs1.getString("money");
				
				rs2 = stmt2.executeQuery("select company from saving_product where name ='"+ name +"'");
				rs2.next();
				String company = rs2.getString("company");
				
				out.println("<tr>");
				%><td><a href="onsultCtmSavingView.jsp" target ="body"><%
				//out.println("<td>" + insId + "</td>");
				out.println(savId);
				session.setAttribute("savId", savId);
				%></a></td><%
				out.println("<td>" + name + "</td>");
				out.println("<td>" + period + "</td>");
				out.println("<td>" + month + "</td>");
				out.println("<td>" + money + "</td>");
				out.println("<td>" + company + "</td>");
				out.println("</tr>");
			//}
		}
		%> 
       </table>
       
    
		
	<%}
	}
	catch(Exception e){
		e.printStackTrace();
		out.println("�������");
	}
%>
       
    </div>
    
</div>
</body>
</html>