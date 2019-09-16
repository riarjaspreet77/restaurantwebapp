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
String category_type=request.getParameter("category_type");
System.out.println(category_type);
session.setAttribute("category_type",category_type);

try {
	Class.forName("com.mysql.jdbc.Driver");

	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant","root","root");
	Statement stm= con.createStatement();
	
	
	// inserting value 
	//stm.executeUpdate("insert into form_null_layout values(null,'"+employ_id+"','"+employ_password+"')");
	String query = "SELECT * FROM menu where category='"+category_type+"' ";
	   
		session.setAttribute( "category",category_type);
		
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
		    int item_no = rs.getInt("item_no");
		    System.out.println(item_price);
		    System.out.println(item_no);
			session.setAttribute( "item_no",item_no);

		    %>
		    <form action="update_menu" method="post">
		    <input type="text" name="item_name" value=<%=item_name %>>
		     <input type="text" name="item_price" value=<%=Integer.toString(item_price) %>>
		     
		      <input type ="submit" value="update" name="update">
		      <input type ="submit" value="remove" name="remove">
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
<br>
<form action="insert_menu" method="post">
<input type="text" name="item_name" value="item_name" ></input>
<input type="text" name="item_price" value="item_price" ></input>
<input type="submit" value="insert" ></input>
</form>
</body>
</html>