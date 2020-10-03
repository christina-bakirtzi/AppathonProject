<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="DAO.*"%>
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
#container {
  text-align: center;
}

.button {
  display: inline-block;
}
.button1 {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  display: inline-block;
}

.wrapper {
  text-align: center;
  display: inline-block;
  position: absolute;
  top: 50%;
  left: 50%;
}

</style>

<meta charset="ISO-8859-1">
<title>My Homepage</title>
</head>
<body style="background-color:powderblue;">
<div class="topnav">
  <a class="active" href="register.jsp">Home</a>
  <a href="products.jsp">Products</a>
  <a href="basket.jsp">Your Cart</a>
  <a  href="update.jsp">Update Info</a>
</div>
 <div align="center">
	<jsp:useBean id="user" class="Pack.User" />
	<jsp:setProperty property="*" name="user" />
<fieldset style = "width: 50%">
	<h1 style="font-family:Book Antiqua;">Welcome to TechLab ${sessionScope.username}!</h1><br>

	<img src="images\WALLPAPER.jpg">
	<p style="font-size:20px; font-family:Book Antiqua;">Feel free to navigate through all of our products and buy anything you desire!</p>  
	<form method="post" action="products.jsp">
			<button class="button button1" id="products"  name="products">Take me to Products!</button><br></br>
		</form>
</fieldset>
</div>
</body>
</html>