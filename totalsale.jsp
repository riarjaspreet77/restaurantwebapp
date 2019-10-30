<%@page import="javafx.util.converter.LocalTimeStringConverter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession,java.util.Date, java.time.LocalDate,java.time.LocalTime, java.time.*,java.text.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Date date = new Date();
System.out.println(date.toString());
SimpleDateFormat ft_date=new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat ft_time=new SimpleDateFormat("hh:mm:ss");
String date1=ft_date.format(date);
String time11=ft_time.format(date);
System.out.println(date1);
System.out.println(time11);
int total=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	// updating value value 
	//stm.executeUpdate("update customer_data set date='"+date1+"',time='"+time11+"'  ");
	//inserting value
	//stm.executeUpdate("insert into customer_data values(11,22,null,31,41,51,11,'"+date1+"','"+time11+"')");
	//String query = "SELECT * FROM employee_data where employee_id='"+employ_id_search+"' ";
     String query = "SELECT * FROM master_table where date='"+date1+"' ";

	ResultSet rs = stm.executeQuery(query);
	while(rs.next())
		{  
			System.out.print("yes");
			
		    String item_name1 = rs.getString("date");
		    String item_name = rs.getString("time");
		    int total_1 = rs.getInt("total");
		    total=total_1+total;
		    System.out.println(item_name1);
		    System.out.println(item_name);
		    
  
		}
	
	System.out.println(total);
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%>
<%=total%>
</body>
</html>