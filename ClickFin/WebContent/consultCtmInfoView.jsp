<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
    
<% String userId = "";
   userId = (String)session.getAttribute("userId");
   if(userId == null || userId.equals(""))
   {
      %><script>alert("�߸��� �α���");
      location.href("login.html");
      </script><%
      
   }%>
    
    <%String searchStr = request.getParameter("searchStr");//�˻��Ϸ��� ���ڿ�
       %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ - ���� ��������</title>
<link rel="stylesheet" href="navbar.css">

</head>
<font size = "20px" ,style = "text-align:center">Click Fin _ ������Ʈ���</font>

<style>
td,tr,th{
   border: 1px gray solid;
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
<!-- customer's personal Info View -->
   <div id="content" style="width: 800px;">
      <h2>�� ��������</h2>
      <form action="consultCtmInfoView.jsp">
      
      <select id="searchCond" style="width:100px;">
         <option value="�̸�">�̸�</option>
      </select>
      
      <!-- ���õ� select�޴� -->
      <script type="text/javascript">
    function CheckSelect(){
        var ctrlSelect = document.getElementById("searchCond");
        if( ctrlSelect.selectedIndex == 0){
            //alert("���ɻ����� �����Ͻÿ�.");
            ctrlSelect.focus();
        }else{
            //window.alert("����� ���ɻ��� : " + ctrlSelect.value );
        }
    }
  </script>
      
      
      <input type="text" name="searchStr" style="width:300px">
      <input type="submit" value="�˻�" onclick="CheckSelect();")>
      
      </form>
   <%
   //if(!"".equals(searchStr))//�˻��Ϸ��� ���ڿ��� DB���� �˻��ϰ� �����ϸ� ���
   //{
   Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
   ResultSet rs1 = null;
   ResultSet rs2 = null;
   Statement stmt1 = null;
   Statement stmt2 = null;
   DataSource ds;
   try{
      Context init = new InitialContext();
      ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
      conn = ds.getConnection();
      stmt1 = conn.createStatement();
      stmt2 = conn.createStatement();
      String sql = "select * from users where name='" + searchStr + "'and id in( select id from customer where consul_id ='"+userId+"')";
      rs1 = stmt1.executeQuery(sql);
while(rs1.next()){
   String name = rs1.getString("name");
   String rrn = rs1.getString("rrn");
   String phone = rs1.getString("phone");
   String address = rs1.getString("address");
   rs2 = stmt2.executeQuery("select marry, child, anniversary from customer where consul_id = '" +userId +"'");
   rs2.next();
   String marry = rs2.getString("marry");
   String child = rs2.getString("child");
   String anniversary = rs2.getString("anniversary");
   %>
   		<%
session.setAttribute("cusName", name); 
session.setAttribute("cusRrn",rrn );
session.setAttribute("cusPhone", phone);
session.setAttribute("cusAddress", address);
session.setAttribute("cusMarry", marry); 
session.setAttribute("cusChild",child );
session.setAttribute("cusAnniversary", anniversary);
%>
      <br>
      <table width="70%"style="border-collapse:collapse;
            border: 1px solid gray;">
         <tr>
            <th>�̸�</th>
            <td><%= name%></td>
         </tr>
         <tr>
            <th>�ֹι�ȣ</th>
            <td><%= rrn%></td>
         </tr>
         <tr>
            <th>����ó</th>
            <td><%= phone%></td>
         </tr>
         <tr>
            <th>�ּ�</th>
            <td><%= address%></td>
         </tr>
         <tr>
            <th>��ȥ����</th>
            <td><%= marry %></td>
         </tr>
         <tr>
            <th>�ڳ�</th>
            <td>
               <%= child %>
            </td>
         </tr>
         <tr>
            <th>�����</th>
            <td>
            	<%= anniversary %>
            </td>
         </tr>
      </table>
     <%}
   } catch(Exception e){
      e.printStackTrace();
      out.println("�������");
   }
    %>
<!-- Button for modifying Customers' personal Info -->
   <div width="70%">
      <br>
      <form action="consultCtmInfoModify.jsp" method="post">
      <%session.setAttribute("searchStr",searchStr);
      //response.sendRedirect("consultCtmInfoModify.jsp");%>
      <input type="button" value="�˻��� ����������" style="float:right;"
         onclick="location.href='consultCtmInfoModify.jsp'")>
      </form>
   </div>
   
   </div>
</div>


</body>
</html>