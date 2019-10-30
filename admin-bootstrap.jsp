<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/table.css">

  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
  
  
    .row{
    height:500px;
    width:100%;
  background-color: "blue";
    }
   
   
    .sidenav {  border:4px solid;
   overflow:auto;
     background-color: #f1f1f1;
      height: 100%;
       border-radius:10px;
    }
    
    
    #table1{
    border:4px solid;
    border-radius:10px;
    border-color:red;
      height: 100%;
      overflow:auto;
    }
  

    footer {
    margin-top:10px;
      background-color: #555;
      color: white;
      padding: 15px;
    }
 

    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row content{height: auto;} 
    }
    
    
  .page-header {
         border-radius: 10px;
      height:50px;
    }
    #admin-task{
     background-color: #feffff;
  border: 1px solid;
  border-color: #c4c4c4 #d1d1d1 #d4d4d4;
  border-radius: 2px;
  outline: 5px navy #eff4f7;
  -moz-outline-radius: 3px;
  -webkit-box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.12);
  color: #000000;
  padding: 20px;
  width:170px;
  text-align: center;
  text-decoration: none;
  display:block;
  font-size: 14px;
  margin: 14px 56px;
  border-radius: 12px;
  -webkit-transition-duration: 0.4s; 
  transition-duration: 0.4s;
 /*  float: left;} */}
#admin-task:hover {
  background-color: #005392; /* Green */
  color: #feffff;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
 
  </style>
<title>Insert title here</title>

</head>
<body>
 <!-- header -->
<div class="page-header">
<%@ include file="bootstrap_header-admin.jsp" %>
</div>
<div class="container-fluid">
                           
<!-- middle -->
<div class="row">
    <div class="col-sm-3 " id="table1">
      <input type="button" onclick="location.href='edit-employe-admin.jsp';" value="Edit employ" class="btn" id="admin-task"/>
       <input type="button" onclick="location.href='edit-menu-admin.jsp';" value="Edit menu" class="btn" id="admin-task"/>
       <input type="button" onclick="location.href='cash-admin.jsp';" value="Cash analysis"class="btn" id="admin-task" />
    </div>
    
    
    
    
<!-- task -->



    <div class="col-sm-9 sidenav ">
    
    <%@ include file="admin-task.jsp" %>

  </div>
</div>

<!-- footer -->
<%@ include file="footer.jsp" %>
</div>
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
</body>
</html>
