<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  String userId = "";
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
<title>�� ���� - �� ��ü ��Ȳ</title>
<link rel="stylesheet" href="navbar.css">


</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
td, tr, th{
   border: 1px gray solid;
   text-align: center;
}
</style>

<body>
<br>
    <div style = "text-align:right" ><%=userId %>�� ȯ���մϴ�.<br>
    <a href ="logout.jsp" >�α׾ƿ�</a></div>
<!-- navigator -->
<div id="container" style="width: 1000px;">
    <div id="menu" style="width: 200px;float:left;">
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
            <div class="title">��ǰ�� ��Ȳ</div>
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
    <div id="content" style="width: 800px">
       <h2>������</h2>
       <form action="consultShowAllCustom.jsp">
          <input type="text" name="customName">
          <input type="button" value="�˻�" onclick="">
       </form>

<!-- ����, ����, ȣĪ, ȸ���, ����ó, �ݵ��, ����� -->

<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
   ResultSet rs1 = null;   //������� id, �̸�, �������, ��ȣ, �ּ�, �̸����ּҸ� �������� ���� resultset
   ResultSet rs2 = null;   //������Ʈ�� �̸�, ��ȣ, �̸����ּҸ� �������� ���� resultset
   DataSource ds;
   try{
      Context init = new InitialContext();
      ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
      conn = ds.getConnection();
      Statement stmt1 = conn.createStatement();
      Statement stmt2 = conn.createStatement();
      %>
      <table width="70%"
       style="border-collapse:collapse;border:1px gray solid;
       margin-top: 20px;">
       <thead>
         <th>����</th>
         <th>����</th>
         <th>ȣĪ</th>
         <th>ȸ���</th>
         <th>����ó</th>
         <th>�ݵ��</th>
         <th>�����</th>
       </thead>
      <tbody id="customTbody">
         <%
         rs1 = stmt1.executeQuery("SELECT id, name, phone FROM users WHERE id IN ("+
                  "SELECT id FROM customer WHERE consul_id = '"+ userId  +"')");
         int i=0;
         while(rs1.next()) {
            i++;
            String cusId = rs1.getString("id");
            String name = rs1.getString("name");
            String phone = rs1.getString("phone");
            rs2 = stmt2.executeQuery("SELECT nick, company FROM customer WHERE id = '"+cusId+"'");
            rs2.next();
            String nick = rs2.getString("nick");
            String company = rs2.getString("company");

            out.println("<tr>");
            out.println("<td>" + i + "</td>");
            out.println("<td>" + name + "</td>");
            out.println("<td>" + nick + "</td>");
            out.println("<td>" + company + "</td>");
            out.println("<td>" + phone + "</td>");
            out.println("<td>" + "0" + "</td>");
            out.println("<td>" + "0" + "</td>");
            out.println("</tr>");
            
         }
         %>
      </tbody>

      
       </table>
      
      <%
   } catch(Exception e){
      e.printStackTrace();
      out.println("�������");
   }
    %>
    
    <input type="button" value="�� ��ǰ���" style="margin:10px;float:right"
    onclick="location.href='consultRegistWhichProduct.jsp'">
    <input type="button" value="�� ����ϱ�" style="margin:10px;float:right"
   	onclick="location.href='consultRegistCtm.jsp'")>
    
    </div>
</div>


</body>
</html>