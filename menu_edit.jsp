<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="searchmenu.jsp" method="post">
<table>
<input type="text" name="category" ></input>
<input type="submit" value="search" ></input>
</table>
</form>
<br>
<form action="insert_menu" method="post">
<input type="text" name="item_name" value="item_name" ></input>
<input type="text" name="item_price" value="item_price" ></input>
<input type="text" name="category" value="category" ></input>
<input type="submit" value="insert" ></input>
</form>
</body>
</html>