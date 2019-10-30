<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  


<title>Insert title here</title>
<style type="text/css">  footer {
      background-color:black;
      color: white;
      padding: 15px;
       border-radius: 10px;
    }
    .clock{
   color:white;}
   
   .title{
   font-family:  monospace;
   font-style: italic;}
    </style>
</head>
<body>
<footer class="container-fluid text-center">
  <p class="title">One cannot think well, love well, sleep well, if one has not dined well</p>
  <a class="clock"><%@ include file="clock.jsp" %></a>
</footer>
</body>
</html>