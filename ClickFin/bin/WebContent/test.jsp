<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login</title>
<% 
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
ResultSet rs = null;
Statement stmt = null;
DataSource ds;
try{
	Context init = new InitialContext();
	ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
	conn = ds.getConnection();
	String sql;
	//String sql = "select * from users";
	//sql = "alter table invest add user_id varchar(30)";
	//sql = "alter table invest add foreign key (user_id) references users(id)";
	//sql = "create table insurance_product (name varchar(15), company varchar(30), fee varchar(20), period varchar(30), ensure varchar(30), primary key(name))";
	//sql = "alter table insurance_product modify name varchar(30)";
	//sql = "create table insurance (id varchar(30), period varchar(30), name varchar(30), user_id varchar(30), "+
	//		"primary key (id), foreign key (name) references insurance_product(name), foreign key (user_id) references users(id))";
	//sql = "alter table fund add user_id varchar(30)";
	//sql = "alter table fund add foreign key (user_id) references users(id)";
	//sql = "alter table saving add user_id varchar(30)";
	//sql = "alter table saving add foreign key (user_id) references users(id)";
	//sql = "insert into insurance_product values('�ڵ�������', '�Ｚȭ��', '30000', '12', '�ڵ���')";
	//sql = "insert into insurance values('in01', '170703-180703', '�ڵ�������', 'customer')";
	//sql = "insert into invest_product values('������','30%')";
	//sql = "insert into invest values('inv01', '������', '170704-180704', '3��', '18/07/04', 'customer')";
	//sql = "insert into fund_product values('������ݵ�','�������', '�ֽ���')";
	//sql = "insert into fund values('fun01', '������ݵ�', '17/07/04', '2��', '100��', 'customer')";
	//sql = "insert into saving_product values('����������','��������')";
	//sql = "insert into saving values('sav01', '����������', '170704-180704', '50��', '5��', 'customer')";
	sql = "alter table customer add (child varchar(50))";
	
	//sql = "create table customer (id varchar(15), consul_id varchar(15), nick varchar(15), marry varchar(5), company varchar(30), anniversary varchar(30), primary key (id), foreign key (id) references users(id), foreign key (consul_id) references consultant(id) ) ";
	
	stmt = conn.createStatement();
	//rs = stmt.executeQuery(sql);
	stmt.executeUpdate(sql);


/* while(rs.next()){
	String id1 = rs.getString("id");
	String pw1 = rs.getString("pw");
	String role = rs.getString("role"); }*/
	
	
	

//rs.close();
stmt.close();
conn.close();
}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
e.printStackTrace();
out.println("�������");
}
%>
</head>
<body>
</body>
</html>