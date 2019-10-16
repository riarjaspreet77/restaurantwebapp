<%@page import="javafx.util.converter.LocalTimeStringConverter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession,java.util.Date, java.time.LocalDate,java.time.LocalTime, java.time.*,java.text.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="date" method="post" >
<input type="date" value ="2018-12-12" name="form_date"/>
<input type="submit">
</form>
<%
Date date = new Date();
System.out.println(date.toString());
SimpleDateFormat ft_date=new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat ft_time=new SimpleDateFormat("hh:mm:ss");
String date1=ft_date.format(date);
String time11=ft_time.format(date);
System.out.println(date1);
System.out.println(time11);




try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	// updating value value 
	//stm.executeUpdate("update customer_data set date='"+date1+"',time='"+time11+"'  ");
	//inserting value
	stm.executeUpdate("insert into customer_data values(11,22,null,31,41,51,11,'"+date1+"','"+time11+"')");
	//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";

	
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	// inserting value 
	//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
	String query = "SELECT * FROM customer_data where sno=244 ";

	ResultSet rs = stm.executeQuery(query);
	if (rs.next())
		{  
			System.out.print("yes");
			
		    String item_name1 = rs.getString("date");
		    String item_name = rs.getString("time");
		    System.out.println(item_name1);
		    System.out.println(item_name);
		    
  
		}
	else 
		{
		System.out.print("nosdhgsfhfsh");
		}
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%>



</body>
</html>