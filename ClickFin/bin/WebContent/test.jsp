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
Connection conn = null;                                        // null로 초기화 한다.
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
	//sql = "insert into insurance_product values('자동차보험', '삼성화재', '30000', '12', '자동차')";
	//sql = "insert into insurance values('in01', '170703-180703', '자동차보험', 'customer')";
	//sql = "insert into invest_product values('금투자','30%')";
	//sql = "insert into invest values('inv01', '금투자', '170704-180704', '3조', '18/07/04', 'customer')";
	//sql = "insert into fund_product values('브라질펀드','대신증권', '주식형')";
	//sql = "insert into fund values('fun01', '브라질펀드', '17/07/04', '2억', '100만', 'customer')";
	//sql = "insert into saving_product values('나라사랑적금','신한은행')";
	//sql = "insert into saving values('sav01', '나라사랑적금', '170704-180704', '50만', '5만', 'customer')";
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
}catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
e.printStackTrace();
out.println("연결실패");
}
%>
</head>
<body>
</body>
</html>