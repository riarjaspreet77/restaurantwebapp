<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.* " %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%
int grand_total=0;
HttpSession session1=request.getSession();
String table_number_1=(String)session1.getAttribute("table_number");

System.out.println(table_number_1);

try {
	Class.forName("com.mysql.jdbc.Driver");

	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
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
%>
</body>
</html>