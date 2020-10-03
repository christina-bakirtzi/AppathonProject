<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><link rel="icon" type="image/png" href="images/faveicon.png"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style> 
.topnav {
  overflow: hidden;
  font-family:Book Antiqua;
  background-color: #4E76A5;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 8px 16px;
  text-decoration: none;
  font-size: 19px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: white;
  color:#4E76A5;
  font-weight:bold;
}
input[type=text] {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}
input[type=password] {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
}
label.clear {
  clear: both;
}
input[type=text]:focus {
  border: 3px solid #555;
}
input[type=password]:focus {
  border: 3px solid #555;
}

.button {
  background-color: #4E76A5; /* Green */
  border: none;
  font-family:Book Antiqua;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-size: 100%;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  font-weight: bold;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
}

.button1 {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({dateFormat: 'dd/mm/yy'});
	});
</script>
</head>
<body style="background-color:powderblue;">
<div class="topnav">
  <a href="login.jsp">Login</a>
  <a class="active" href="create.jsp">Register</a>
</div>
<div align="center">
<fieldset style = "width: 50%">
	    <h1 style="font-family:Book Antiqua;">Register Now!</h1>
		<form action="<%=request.getContextPath()%>/create" method="post">
		<label for= "x" style="font-family:Book Antiqua;font-size: 150%;">Username</label><br>
       	<% Object user = session.getAttribute("username");%>
		<input type="text"style="font-family:Book Antiqua;" name="username" value="<%=(String)user%>" /><br>
		<label for= "y" style="font-family:Book Antiqua;font-size: 150%;">Name</label><br>
		<input type="text" style="font-family:Book Antiqua;" name="name" /><br>
		<label for= "z" style="font-family:Book Antiqua;font-size: 150%;">Password</label><br>
		<input style="font-family:Book Antiqua;" type="password" name="password" /><br>
		<label for= "x" style="font-family:Book Antiqua;font-size: 150%;">Birthdate</label><br>
		<input style="font-family:Book Antiqua;" type="text" id="datepicker" name="birthdate"><br>
		<button class="button button1" value="Register">Register</button></form>
</fieldset>   
    </div></body>

    </html>