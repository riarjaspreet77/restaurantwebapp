<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession, java.util.* " %> 
<!DOCTYPE html>
<html>
<head>
<link href="css/admin.css" rel="stylesheet" type="text/css" media="all">
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String employ_id=(String)session.getAttribute("employ_id"); %>
</head>
<body>
<div class="conatainer">
<div class="header"> 
<img  class="logo" alt="" src="image/logo.jpg"></img>
<a class="p1">Welcome-Admin:<%=employ_id%></a>
<a class="p2">Lazizz</a> 
      <div class="button_header">
       <input type="button" onclick="location.href='table_master.jsp';" value="Billing" class="btn1" />
       <input type="button"  value="demo" class="btn1"/>
       <input type="button"  value="demo"class="btn1" />
       </div>
       <div class="logout">
             <input type="button" onclick="preventBack()" value="Logout" class="btn-logout" />
             </div>
       
       </div></div>
<div class="middle">
      <div class="side1">
      <div class="button">
       <!-- <input type="button" onclick="location.href='employ_edit.jsp';" value="edit employ" class="btn" />
       <input type="button" onclick="location.href='menu_edit2.jsp';" value="edit menu" class="btn"/>
       <input type="button" onclick="location.href='cash_analysis.jsp';" value="cash analysis"class="btn" /> -->
       <button onclick="myFunction()" class="btn">edit employ</button>
      <button onclick="myFunction1()" class="btn">edit menu</button>
      <button onclick="myFunction1()" class="btn">cash analysis</button>
       </div>
       </div>
      <div class="side2">
      <div class="welcome" id="welcome1" style="display:inline;"> <h1>Welcome Admin</h1></div>
     <div class="edit-employ" id="green" style="display:none;">
      <%
String category_type=request.getParameter("category_type");
System.out.println(category_type);
session.setAttribute("category_type",category_type);

try {
	Class.forName("com.mysql.jdbc.Driver");

	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_restaurant?autoReconnect=true&useSSL=false","root","root");
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
<form action="insert_employee2" method="post">
<input type="text" name="employye_id"  placeholder="empolyee_id"></input>
<input type="text" name="password" placeholder="password"></input>
<input type="text" name="admin_access" placeholder="admin_access" ></input>
<input type="submit" value="insert" ></input>
</form>

<br>
<br>
</div>
<div class="edit-cat" id="blue" style="display:none;">
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
		
			
			
		    String category_type1 = rs.getString("category_type");
	
		    System.out.print(category_type1+"  ");
		   
		    %>
		    <form action="editbycat.jsp" >
		 <input type ="submit" value=<%= category_type1 %> name="category_type1">
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
<form action="update_category" method="post">
		    <input type="text" name="category_name">
		     
		      <input type ="submit" value="add" name="add">
		      <input type ="submit" value="remove" name="remove">
		      <br></br>
		    </form>
</div>
</div>
</div>
<div class="footer">footer</div>
</div>
<script>
function myFunction() {
	var x = document.getElementById("green");
	
    var y = document.getElementById("blue");
    var z=document.getElementById("welcome1");
	y.style.display = "none"
    z.style.display = "none"
	x.style.display = "inline"
}
function myFunction1() {
var x = document.getElementById("green");
var z=document.getElementById("welcome1");
    var y = document.getElementById("blue");
    x.style.display = "none"
    	z.style.display = "none"
    y.style.display = "inline"
	
	}
function preventBack(){window.history.forward();}
setTimeout("preventBack()", 0);
window.onunload=function(){null};
window.location.assign("http://localhost:8081/restaurant_webapp/login_master.jsp")
</script>
</body>
</html>