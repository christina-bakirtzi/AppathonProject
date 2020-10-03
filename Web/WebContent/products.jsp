<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Pack.Product"%>

<%
	String connectionURL = "jdbc:mysql://localhost:3306/test?useSSL=false";
	Connection connection = null;
	Statement statement = null;
	ResultSet rs = null;
%>


<html>
<head><link rel="icon" type="image/png" href="images/faveicon.png"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -60px;
  opacity: 0;
  transition: opacity 0.3s;
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
input[type=search] {
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
input[type=search]:focus {
  border: 3px solid #555;
}
::selection {
  color: white;
  background: #4E76A5;
}
.select{
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 3px solid #ccc;
  -webkit-transition: 0.5s;
  transition: 0.5s;
  outline: none;
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

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}
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
</style>
<title>Products</title></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<body style="background-color:powderblue;">
<div class="topnav">
  <a href="register.jsp">Home</a>
  <a class="active" href="products.jsp">Products</a>
  <a href="basket.jsp">Your Cart</a>
  <a href="update.jsp">Update Info</a>
</div>
	<form method="post" action="products">



	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		List<Product> products = new ArrayList<Product>();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		statement = connection.createStatement();
		rs = statement.executeQuery("SELECT * FROM products");
		%>
		<center><br></br>
	<h1 style="font-family:Book Antiqua; font-weight:bold; color:#4E76A5;text-decoration:underline;">TechLab Product List</h1>
	
	<br/>
	<br/>		
	<table class="w3-table-all w3-card-4" style="background-color:powderblue;width:95%;" border="5" >
	<thead style="font-weight: bold; color:#4E76A5">
		<tr>
			<td style="text-align: center;vertical-align:middle;font-size:30px; font-family:Book Antiqua;" > ID </td>
			<td style="text-align: center;vertical-align:middle; font-size:30px; font-family:Book Antiqua;" > NAME </td>
			<td style="text-align: center;vertical-align:middle; font-size:30px; font-family:Book Antiqua;" > IMAGE </td>
			<td style="text-align: center;vertical-align:middle; font-size:30px; font-family:Book Antiqua;" > PRICE (EUR)</td>
			<td style="text-align: center;vertical-align:middle; font-size:30px; font-family:Book Antiqua;"></td>
		</tr>
	</thead>
		<%
		while (rs.next()) {
			Product product = new Product();
			product.setId(rs.getInt("id"));
			product.setName(rs.getString("name"));
			product.setImage(rs.getString("image"));
			product.setPrice(rs.getDouble("price"));
			products.add(product);
			%>

		<tr>
			<td style="font-size:25px; vertical-align:middle;text-align: center; font-family:Book Antiqua;"><%=rs.getInt("id")%></td>
			<td style="vertical-align:middle; font-size:25px; text-align: center; font-family:Book Antiqua;"><%=rs.getString("name")%></td>
			<td style="vertical-align:middle;text-align: center"><img src="images/<%=rs.getString("image")%>.jpg"></td>
			<% double price = rs.getDouble("price");
   			   double VAT = 0.24;
   			   double value = price + Math.round(VAT * price);
%>
			<td style="font-size:25px; text-align: center; vertical-align:middle; font-family:Book Antiqua;"> <div class="tooltip">
			<%=rs.getString("price")%> <span class="tooltiptext"><%=value+" (24% VAT) "%></span>
					</div></td>
			<td style="vertical-align:middle;text-align: center"><button class="button button1" type="submit" name="id" value="<%=rs.getInt("id")%>">Buy Now</button></td>
		</tr>
		<%
		}

		rs.close();
	%>
	</table>
	</center>

</form>
</body>
</html>