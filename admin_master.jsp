<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="background-color: red;width:20%;height:600px; float:left;">
      <button onclick="myFunction()">1</button>
      <button onclick="myFunction1()">2</button>

</div>
<div id="green" style="color:blue;text-align:center;background-color: green; width:80%;height:600px; float:right; margin:0 0 0 0;display:none">
green
</div>
<div id="blue" style="color:blue;text-align:center;background-color: blue; width:80%;height:600px; float:right; margin:0 0 0 0;display:none">
blue

</div >
<script>
function myFunction() {
	var x = document.getElementById("green");
	
    var y = document.getElementById("blue");
	y.style.display = "none"
	x.style.display = "inline"
}
function myFunction1() {
var x = document.getElementById("green");
	
    var y = document.getElementById("blue");
    x.style.display = "none"
    y.style.display = "inline"
	
	}
</script>
</body>
</html>