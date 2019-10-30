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
 <div class="col-sm"><form action="date" method="post" >
<input type="date"  name="from_date"/>
<input type="date"  name="to_date"/>
<input type="submit" value="submit">
</form>
 </div>
            
            
            
            <div class="col-sm-12">
            <h4>Employ Performance </h4>
            <form action="employ_cash" method="post" >
<input type="text"  name="employ_id"/>
<input type="submit" value="submit">
</form>


</div>
        </div>
        </div>
    



</body>
</html>