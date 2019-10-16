
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">




<title>LOGIN</title>

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
<div  class="b">
<form action="login" method="post">
<fieldset>
<legend>Login</legend>
<table>
<tr>
<td>Employ ID:</td>
<td><input type="text" name="employ_id" id="t"></input></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="password" id="t"></input></td>
</tr>
<tr>

<td><input type="submit" value="login" ></input></td>
</tr>
</table>

</fieldset>
</form>
</div>

</body>
</html>