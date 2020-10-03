<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/faveicon.png"/>
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
<title>TechLab</title>
</head>
<body style="background-color:powderblue;">
<div class="topnav">
  <a class="active" href="login.jsp">Login</a>
  <a href="create.jsp">Register</a>
</div>
 <div align="center">
    <fieldset style = "width: 50%">
  <h1 style="font-family:Book Antiqua;">Member Login Form</h1>
  <form action="<%=request.getContextPath()%>/login" method="post">
 
	<label for= "x" style="font-family:Book Antiqua;font-size: 150%;">Username</label><br>
	<input type="text" name="username" style="font-family:Book Antiqua;"/><br>
	<label for ="y" style="font-family:Book Antiqua;font-size: 150%;text-align: center;">Password</label><br></br>
	<input type="password" name="password" style="font-family:Book Antiqua;"/><br>

   
   <button class="button button1" name="login" value="Login" >Login</button>
  </fieldset>
  </form>
 </div>
</body>
</html>