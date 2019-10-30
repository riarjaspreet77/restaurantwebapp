<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.* " %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">



.col-sm-12{background-color:orange;	;
height:490px;
width:100%;
}


</style>
</head>
<body>

<div class="container-fluid">
<div class="row content id="d" ><h4>insert </h4>
 <div class="col-sm"><form action="update_category" method="post">
		    <input type="text" name="category_name">
		     
		      <input type ="submit" value="add" name="add">
		      <input type ="submit" value="remove" name="remove">
		      <br></br>
		    </form>
 </div>
            
            
            
            <div class="col-sm-12">
            <h4>update </h4>
            <%
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
		    <form action="editbycat-admin.jsp" >
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

</div>
        </div>
        </div>
    



</body>
</html>