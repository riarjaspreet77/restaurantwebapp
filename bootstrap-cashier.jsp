<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/cashier_menu.css">

  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .page-header {
      margin-bottom: 0;
      border-radius: 10px;
      height:50px;
    
    }
    .container-fluid{
    width:100%;}
    .row{
    margin:0 0 0 0;
 }
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 600px;
    width:100%;
     }
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
       border-radius: 13px;
       overflow:auto;
   
    }
    
    .text-left{
    overflow:auto;}
    
    
       #right{
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 90%;
      border-radius: 13px;
      overflow:auto;
    }
    /* Set black background color, white text and some padding */
    footer {
      background-color:black;
      color: white;
      padding: 15px;
       border-radius: 10px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
       
      }
      .row.content {height:auto;} 
    }

  </style>
</head>
<body>
<div class="page-header">
<%@ include file="bootstrap_header.jsp" %>
  </div>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <%



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
    <div class="col-sm-6 text-left"> 
      
      <%

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
	<div class="item-container">
	
	<a class="item-name">Item</a>   
	<a class="item-price">Price</a>   
		<a class="item-tax">Tax</a>   
	<a class="item-discount">Discount</a> 
	</div>                            
	<br></br>
	<%
	
	while (rs.next())
		{  
			
			
		    String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price");
		    System.out.print(item_name+"  ");
		   
		    System.out.println(item_price);
		    
		    %>
		    
		  <form action="quantity_update" method="post">
		  
		  <div class="cat" id="middle">
		  
		    <input type="text" name="item_name" value=<%=item_name %> readonly="readonly" class="it-name">
		    
		    <input type="text" name="item_price" value=<%=Integer.toString(item_price) %> readonly="readonly" id="it-price">
		  
		    <input type="text" name="item_name" value=<%=item_name %> readonly="readonly" class="tax">
		    
		    <input type="text" name="item_price" value=<%=Integer.toString(item_price) %> readonly="readonly" id="discount">
		    
		     <input type ="submit" value="Add" name="add" id="btn-add">
		    
		     <input type ="submit" value="Remove" name="remove" class="btn-remove">
		   
		     <br></br>
		     </div>
		    </form> 
  <%
		}
	
	}
	catch(Exception e)
	{ 
		
	}
%>
     </div>
    <div class="col-sm-3 " id="right">
   
		   
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
		    <div class="quant">
		    <form id="rd" >
		
		 <h6 id="ram">NAME</h6><input type="text" name="item_name" value=<%=item_name %> readonly="readonly" class="c-ram">
	<br>	
	 <h6 id="ram">PRICE</h6> <input type="text" name="item_price" value=<%=Integer.toString(item_price) %> readonly="readonly" class="c-ram">
		    <br>
	    <h6 id="ram">QUANTITY</h6> <input type="text" name="quantity" value=<%=Integer.toString(quantity) %> readonly="readonly" class="c-ram">
		<br>
	 <h6 id="ram">TOTAL</h6><input type="text" name="total" value=<%=Integer.toString(total) %> readonly="readonly" class="c-ram">
	
		      <br></br>
		    </form></div>
  <%
		}
	%>
	<div class="total-print">
	  <form action="clear_cart" method="post">
	   <a class="total-bill">Total-Bill</a>
	    <input type="text" name="grand_total" value=<%=grand_total %> readonly="readonly" class="grand">
		     <input type ="submit" value="print" name="print" class="btn-print">

	    
	
	      <br></br>
	    </form></div>
	<%
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}
%>

    </div>
  
<div class="col-sm " id="total">total
</div></div>
</div>

<footer class="container-fluid text-center">
  <p>Build with JAVA</p>
</footer>
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
</body>
</html>
