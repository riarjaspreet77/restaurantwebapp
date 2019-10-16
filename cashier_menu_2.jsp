<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.* " %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String table_number=request.getParameter("table_number");
session.setAttribute( "table_number",table_number);
System.out.print(table_number+"  ");
HttpSession session1=request.getSession();
String table_number_1=(String)session1.getAttribute("table_number");
System.out.print(table_number_1+"  ");

try {
	Class.forName("com.mysql.jdbc.Driver");

	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	
	
	// inserting value 
	//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
	String query = "SELECT * FROM category ";
	   
	
		
	ResultSet rs = stm.executeQuery(query);
	
	
	while (rs.next())
		{  
		
			
			
		    String category_type = rs.getString("category_type");
	
		    System.out.print(category_type+"  ");
		   
		    %>
		    <form action="cashier_show_menu.jsp" >
		 <input type ="submit" value=<%= category_type %> name="category_type">
		      <br></br>
		    </form>
  <%
		}
	
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%>
<form action="bill.jsp" >
		 <input type ="submit" value="bill">
		      <br></br>
		    </form>
</body>
</html>