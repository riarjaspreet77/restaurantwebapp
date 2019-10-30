<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/table.css">
<!-- <script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
  
  
    .row{
    height:500px;
    width:100%;
  background-color: "blue";
    }
   
   
    .sidenav {  border:4px solid;
   overflow:auto;
     background-color: #f1f1f1;
      height: 100%;
       border-radius:10px;
    }
    
    
    #table1{
    border:4px solid;
    border-radius:10px;
    border-color:red;
      height: 100%;
      overflow:auto;
    }
  

    footer {
    margin-top:10px;
      background-color: #555;
      color: white;
      padding: 15px;
    }
 

    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row content{height: auto;} 
    }
    
    
  .page-header {
         border-radius: 10px;
      height:50px;
    }
 
  </style>
<title>Insert title here</title>

</head>
<body>
 <!-- header -->
<div class="page-header">
<%@ include file="bootstrap_header-admin-table.jsp" %>
</div>
<div class="container-fluid">
                           
<!-- middle -->
<div class="row">
    <div class="col-sm-9 " id="table1">
     <%
int number_table=1;
int table_occupied[];
int flag=0;
int ik=1;

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
			
			number_table = rs.getInt("number_table");
		    /* String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price"); */
		    System.out.println(number_table+" get ");
		 /*    System.out.print(item_no+"  ");
		    System.out.println(item_price); */
		    for (int i = 1;i<=number_table;i++)
     {
		    	%>
		    	<div class="button"><form action="table_admin" method="post">
		    <input type ="submit" value=<%= i %> name="table_number" class="btn" >
		    	   
		    </form></div>
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
table_occupied=new int[number_table];
%>
    </div>
    
    
    
    
<!-- table vacancy -->



    <div class="col-sm-3 sidenav ">
    <h3 class="tv">Table Vacancy</h3>
    
     <%try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
			;
	Statement stm= con.createStatement();
	
	String query = "SELECT DISTINCT table_no FROM customer_data ";
		
	ResultSet rs = stm.executeQuery(query);
	%>
	

	<%

	int k=0;
	while (rs.next())
		{  
			
			int occupied_table = rs.getInt("table_no");
			 System.out.println(occupied_table+"org");
			 table_occupied[k]=occupied_table;
			 System.out.println(table_occupied[k]+"copy");
		    /* String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price"); 
		    ;*/
		    
		 /*    System.out.print(item_no+"  ");
		    System.out.println(item_price); */
		    k=k+1;
%>
		   
  <% 
		}
	for( int l=0;l<number_table;l++){
		  System.out.println(table_occupied[l]);
	  }
	}
	catch(Exception e)
	{ 
		System.out.println(e);
	}


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
			
			int number_table1 = rs.getInt("number_table");
		    /* String item_name = rs.getString("item_name");
		    int item_price = rs.getInt("item_price"); */
		    System.out.print(number_table1+"  second ");
		 /*    System.out.print(item_no+"  ");
		    System.out.println(item_price); */
		    for ( int ip= 1;ip<=number_table1;ip++)
		    	 
                      {
		    	        flag=0;
                    	  for (int j=0;j<number_table;j++)
    	                      {
    	                          if(ip==table_occupied[j])
    	                           { 
    		                        flag=1;
    		                        System.out.println("flag 1 for "+ ip);
    	                       }
    	                      }
		                System.out.println("flag 0 for "+ ip);

    	              if(flag==0){
		    	%>
		    	<div class="button1"><form action="tablenumber_master" method="post">
		    <input type ="text" value=<%= ip %> name="table_number"  class="btn2" readonly>
		    	   
		    </form></div>
		    	<% 
    	 }
	
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
  </div>
</div>

<!-- footer -->
<%@ include file="footer.jsp" %>
</div>
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
</body>
</html>
