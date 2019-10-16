<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.* " %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/cashier_menu.css" rel="stylesheet" type="text/css" media="all">
<title>Insert title here</title>
<%
String employ_id=(String)session.getAttribute("employ_id"); %>
</head>
<body>
<!-- <div class="main"> -->
<div class="header">
<header>
<a class="p1">welcome <%=employ_id%></a>
<a class="p2">lazizz</a>
</header>
</div>

<div class="m1">
<div class="m1 side"><%



String table_number_1=(String)session.getAttribute("table_number");
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
		   <div class="button"> <form action="category_type_1" method="post" >
		 <input type ="submit" value=<%= category_type %> name="category_type" class="btn">
		      <br></br>
		    </form></div>
  <%
		}
	
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%>

</div>
<div class="m1 middle"><%

String category_type=(String)session.getAttribute("category_type");
System.out.print(category_type+"  ");
String table_number_11=request.getParameter("table_number");
try {
	Class.forName("com.mysql.jdbc.Driver");

	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	
	
	// inserting value 
	//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
	String query = "SELECT * FROM menu where category='"+category_type+"' ";
	   
	/* session.setAttribute( "category",category_type); */
		
	ResultSet rs = stm.executeQuery(query);
	%>
	
	Name                    price                  
	<br></br>
	<%
	
	while (rs.next())
		{  
			
			
		    String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price");
		    System.out.print(item_name+"  ");
		   
		    System.out.println(item_price);
		    
		    %>
		    
		 <div class="cat">  <form action="quantity_update" method="post">
		    <input type="text" name="item_name" value=<%=item_name %> readonly="readonly">
		    <input type="text" name="item_price" value=<%=Integer.toString(item_price) %> readonly="readonly">
		    
		    
		     <input type ="submit" value="add" name="add">
		     <input type ="submit" value="remove" name="remove">
		     <br></br>
		     
		    </form></div> 
  <%
		}
	
	}
	catch(Exception e)
	{ 
		
	}
%></div>

<div class="m1 side">
     
		   
		    <%int grand_total=0;


System.out.println(table_number_1);

try {
	Class.forName("com.mysql.jdbc.Driver");

	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	
	
	// inserting value 
	//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
	String query = "SELECT * FROM customer_data where table_no='"+table_number_1+"'  ";
	   
	
		
	ResultSet rs = stm.executeQuery(query);
	
	
	while (rs.next())
		{  
		
			
			
		    String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price");
		    int quantity = rs.getInt("quantity");
		    int total = rs.getInt("total");
		    grand_total=grand_total+total;
		    
		   
		    %>
		    <form  >
		    <input type="text" name="item_name" value=<%=item_name %> readonly="readonly">
		    <input type="text" name="item_price" value=<%=Integer.toString(item_price) %> readonly="readonly">
		    <input type="text" name="quantity" value=<%=Integer.toString(quantity) %> readonly="readonly">
		    <input type="text" name="total" value=<%=Integer.toString(total) %> readonly="readonly">
		    
		
		      <br></br>
		    </form>
  <%
		}
	%>
	  <form action="clear_cart" method="post">
	    <input type="text" name="grand_total" value=<%=grand_total %> readonly="readonly">
		     <input type ="submit" value="print" name="print">

	    
	
	      <br></br>
	    </form>
	<%
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%></div>
</div>
<!-- </div> -->
<div class="footer">footer</div>


</body>
</html>