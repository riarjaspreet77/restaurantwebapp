<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap header</title>
  <%
String employ_id=(String)session.getAttribute("employ_id"); %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   
<script src = "http://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src = "http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  
<style type="text/css">
.navbar-header{height:70px;
      }
      
     #logout{
     height:30px;
     width:60px;
     color:white;
      background-color: #E74C3C ;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 1px;
  outline: 5px navy #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  padding: 5px;
  width:120px;
  text-align: center;
  text-decoration: none;
  font-size: 13px;
  margin: 4px 6px;
  border-radius: 19px;
  -webkit-transition-duration: 0.4s; 
  transition-duration: 0.4s;}
      
      #logout:hover{background-color:red;
       color: white;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    border-radius: 12px;}
    
    
    .txt-header{
    color:white;
    margin-right:9px;}
    
    #tables{ 
    color: white;
    height:50%;
    width:auto;
    padding:0px;
    border-radius:20px;
    margin-left:250px;
    margin-top:20px; 
    text-align: center;
    }
   
    
    
    
    
    #logo{
    border-radius:15px;
    height:50px;
    width:100px;}
    
    
    #title{
    color:white;
    font-size:10px;
    margin-top:50px;
    margin-right:0px;}
    
    
    #laziz{
    color: white;
    font-family: cursive;
    font-size: 50px;}
    
 
    .navbar-custom { 
            background-color:#148F77; 
        }
        
          #table{
        color:white;
       }
       #table:hover{
       background-color:white;
       color:black;
       border-radius: 13px;}
        #home{
        color:white;
        margin-left:10px;}
         #home:hover{
       background-color:white;
       color:black;
       border-radius: 13px;}
      </style>
</head>
<body>
<nav class="navbar  navbar-custom navbar-fixed-top">
  
  <div class="container-fluid">
    <div class="navbar-header">
    
      <a class="navbar-brand" href="#">
        <img id="logo" alt="Brand" src="image/logo.jpg">
      </a>
      <h2 class="navbar-text" id="laziz">LaziZ</h2>
    <h4 class="navbar-text" id="title">Made with Love <span class="glyphicon glyphicon-heart" style=color:red;></span></h4>
    </div>
            <div class="navbar-nav"  id="tables">
        <ul class="nav navbar-nav">
        <li><a href="bootstrap_example.jsp" class="navbar-brand" id="table"><strong>Tables</strong></a>
     
        </li>
        </ul>     
                </div>
         
     <div class="nav navbar-nav navbar-right">
      <h3 class="txt-header">welcome:<%=employ_id%></h3>
      
               <a href="logout.jsp" class="navbar-brand" id="logout"><strong>Logout</strong></a>
              
            </div>
  </div>
</nav>

</body>
</html>