<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/table.css" rel="stylesheet" type="text/css" media="all">

<title>Insert title here</title>
<%
String employ_id=(String)session.getAttribute("employ_id"); %>
</head>
<body>
<div class="main">
<div class="header">
<header>
<a class="p1">welcome <%=employ_id%></a>
<a class="p2">lazizz</a>
</header>
</div>
<div class="middle">
<div class="m1 side"><%
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
		    	<div class="button"><form action="tablenumber_master" method="post">
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
<div class="m1 middle">Table Vacancy

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
<div class="footer">footer</div>

</div>
</body>
</html>