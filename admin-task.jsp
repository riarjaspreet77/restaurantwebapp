<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

#d{
/* margin-top: 160px;
margin-left:20px; */
 }


#grid3-3{background-color:red;	
height:150px;
border:2px solid;
border-color: gray;
border-radius: 15px;
}
#grid3-1{background-color:black;	
height:150px;
border:2px solid;
border-color: white;
border-radius: 15px;
}
#grid3-2{background-color:yellow;	
height:150px;
border:2px solid;
border-color: red;
border-radius: 15px;
}
#grid3-4{background-color:aqua;	
height:150px;
border:2px solid;
border-color: red;
border-radius: 15px;
}

.col-sm{background-color:blue;	
height:490px;
width:100%;
}


.col-sm-12{background-color:orange;	
height:50px;
}


</style>
</head>
<body>

<div class="container-fluid">
<div class="row content id="d">
  <div class="col-sm">
   
        <div class="row-fluid">
            <div class="col-sm-3" id="grid3-1">
 Fluid 1</div>
            <div class="col-sm-3" id="grid3-2">Fluid 2</div>
            <div class="col-sm-3" id="grid3-3">Fluid 3</div>
            <div class="col-sm-3" id="grid3-4">Fluid 4</div>
        </div>
        <div class="row-fluid">
            <div class="col-sm-12">


            </div>
        </div>
        </div>
        </div>
      </div>
 
  


</body>
</html>