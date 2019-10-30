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
<div class="row content id="d">
 <div class="col-sm"><h4>insert </h4><form action="insert_employee2" method="post">
<input type="text" name="employye_id" placeholder="employee-ID" ></input>
<input type="text" name="password" placeholder="Password" ></input>
<input type="text" name="admin_access" placeholder="Admin-Access" ></input>
<input type="submit" value="insert" ></input>
</form></div>
            <div class="col-sm-12">
            <h4>update </h4>
            <%
String category_type=request.getParameter("category_type");
System.out.println(category_type);
session.setAttribute("category_type",category_type);

try {
	Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","Rschakar21");
	Statement stm= con.createStatement();
	
	
	
	String query = "SELECT * FROM employee_data ";
	   
	
	
		
	ResultSet rs = stm.executeQuery(query);
	%>
	employee-id  /password   /Admin access
	               
	<br></br>
	<%
	
	while (rs.next())
		{  
			
			
		    String employee_id1 = rs.getString("employee_id");
		    String admin_access1 = rs.getString("admin_access");
		    int sno = rs.getInt("sno");
		    String password = rs.getString("password");
		    String sn1 ="sno"+employee_id1;
			session.setAttribute( "sn1",sno);
            System.out.println(sno);
		    %>
		    <form action="update_employee2" method="post">
		    <input type="text" name="sno" value=<%=sno%> readonly>
		    <input type="text" name="employee_id1" value=<%=employee_id1%>>
		      <input type="text" name="password" value=<%=password %>>
		      <input type="text" name="admin_access1" value=<%=admin_access1%>>
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
</div>
        </div>
        </div>
    



</body>
</html>