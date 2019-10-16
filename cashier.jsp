<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
<%
String restaurant_name1="laziz";
/*  add sessio  */
System.out.println(restaurant_name1);
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			;
	Statement stm= con.createStatement();
	
	String query = "SELECT * FROM restaurant_data where restaurant_name='"+restaurant_name1+"' ";
		
	ResultSet rs = stm.executeQuery(query);
	%>
	

	<%
	
	while (rs.next())
		{  
			
			int number_table = rs.getInt("number_table");
		    /* String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price"); */
		    System.out.print(number_table+"  ");
		 /*    System.out.print(item_no+"  ");
		    System.out.println(item_price); */
		    for (int i = 1;i<=number_table;i++)
     {
		    	%>
		    	<form action="cashier_menu_2.jsp" >
		    	<input type ="submit" value=<%= i %> name="table_number">
		    	   <br></br>
		    </form>
		    	<% 
	}
	
		    %>
		
		   
  <%
		}
	
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%>
</body>
</html>