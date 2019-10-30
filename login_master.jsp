<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/NewFile.css" rel="stylesheet" type="text/css" media="all">

<title>Insert title here</title>
 
	
</head>
<body>

<% Object msg= session.getAttribute("error_msg"); %>

 <% 
 if(msg==null)
	 {
	}
 else{
 	%> 
 	<%= session.getAttribute("error_msg") %>
 <% 
 session.setAttribute( "error_msg","");
 } 
 %>
<div class="container">
      
  <div class="login">
    <h1>Welcome To LaziZ</h1>
    <form method="post" action="login" >
      <p><input type="text" name="employ_id" value="" placeholder="Username " id="username"></p>
      <p><input type="password" name="password" value="" placeholder="Password" id="password"></p>
     
      <p class="submit"><input type="submit"  name="commit" value="Login" onClick="return validateForm()"></p>
    </form>
  </div>
  
  
 
  <div class="login-help">
    <h4>Only For Professionals.</h4>
  </div>
</div>
<script>
    function validateForm() {
        var un = document.getElementById("username").value;
        var pw = document.getElementById("password").value;
        if ((un == null) || (pw == "")) {
            return false;
            {
            	alert ("Login was unsuccessful, please check your username and password");
            }
        }
        else {
           
            return true;
        }
  }
</script>
</body>
</html>