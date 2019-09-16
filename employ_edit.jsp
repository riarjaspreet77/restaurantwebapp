<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="search_employ" method="post">
<table>

<input type="text" name="employ_id_search" ></input>
<input type="submit" value="search" >
<br></br>
<% Object msg_password= session.getAttribute("password_found"); %>
<% Object msg_admin_access= session.getAttribute("admin_access_found"); %>
 <% 
 if(msg_password==null && msg_admin_access ==null)
	 {
	 %>
	 <input type="text" name="password" value="password"></input>
	 <input type="text" name="admin_access" value="admin access"></input>
	 <input type="text" name="employ_id_table" value=<%=session.getAttribute("employ_id_from_table")%>></input>
	<% }
 
 else{
	 %>
</table>
</form>
<form  action="update_employ" method="get">
 	 <input type="text" name="password" value= "<%=session.getAttribute("password_found")%>"></input>
	 <input type="text" name="admin_access" value=<%=session.getAttribute("admin_access_found")%>></input>
	 <input type="text" name="employ_id_table" value=<%=session.getAttribute("employ_id_from_table")%>></input>
 <% 
	session.setAttribute( "password_found","");
	session.setAttribute( "admin_access_found","");
 } 
 %>
<br></br>
<input type="submit" value="update" name="update">
<input type="submit" value="insert" name="insert">
</form>
</body>
</html>