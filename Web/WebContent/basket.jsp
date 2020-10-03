<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="Pack.Product"%>
<%@ page import="Pack.Country"%>
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

}

</style>
<title>Your Cart</title></head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<body style="background-color:powderblue;">
<div class="topnav">
  <a href="register.jsp">Home</a>
  <a href="products.jsp">Products</a>
  <a class="active" href="basket.jsp">Your Cart</a>
  <a  href="update.jsp">Update Info</a>
</div>


<div align="center"><br></br>
<h1 style="font-family:Book Antiqua; font-weight:bold;">This is your cart ${sessionScope.username}!</h1>


	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "");
		statement = connection.createStatement();
		rs = statement.executeQuery("SELECT * FROM cart");
		double sum = 0.0;
		%>
		<center>
	
	<br/>
	<br/>		
	<table class="w3-table-all w3-card-4" style="background-color:powderblue;width:80%" border="4" width:80%">
	<thead style="font-weight: bold; color:#4E76A5">
		<tr>
			<td style="text-align: center; font-size:30px; font-family:Book Antiqua;" > PRODUCT ID </td>
			<td style="text-align: center; font-size:30px;  font-family:Book Antiqua;" > QUANTITY </td>
			<td style="text-align: center; font-size:30px;  font-family:Book Antiqua;" > TOTAL PRICE </td>
		</tr>
	</thead>
		<%
		while (rs.next()) {
			sum = sum + rs.getDouble("total_price");
			%>

		<tr>
			<td style="font-size:25px; text-align: center" style="font-family:Book Antiqua;"><%=rs.getInt("product_id")%></td>
			<td style="font-size:25px; text-align: center" style="font-family:Book Antiqua;"><%=rs.getInt("quantity")%></td>
			<td style="font-size:25px; text-align: center" style="font-family:Book Antiqua;"><%=rs.getDouble("total_price")%></td>

		</tr>
		
		<%
		}
		rs.close();
		%>
	</table>
	</center>
	
	
	
	<p></p>
	<br></br>
	<fieldset style = "width: 50%">
	<form method="post" action="order">

 	<p style="font-size:30px; font-family:Book Antiqua;text-decoration: underline;">Choose your <strong> country </strong></p>   
    <select class = "select" id="mySelect" name= "mySelect" onchange="SelectFunction()">
    <option disabled selected value> -- select an option -- </option>
    <%
    List<Country> countries = new ArrayList<Country>();
    Country country1 = new Country();
    country1.setCountry("Greece");
    country1.setFee(0.24);
    countries.add(country1);
    Country country2 = new Country();
    country2.setCountry("Italy");
    country2.setFee(0.22);
    countries.add(country2);
    Country country3 = new Country();
    country3.setCountry("Hungary");
    country3.setFee(0.27);
    countries.add(country3);
    Country country4 = new Country();
    country4.setCountry("France");
    country4.setFee(0.20);
    countries.add(country4);
    Country country = new Country();
    country.setCountry("Netherlands");
    country.setFee(0.21);
    countries.add(country);
    ArrayList<Double> total_sum = new ArrayList<Double>();
    for (int i = 0; i < countries.size(); i++) {
    		total_sum.add( Math.round(sum * countries.get(i).getFee()*100)/100 + sum);%>
	<option value=<%=total_sum.get(i)%>><%=countries.get(i).getCountry()%></option><% }%>
	</select>


<script type="text/javascript">
function SelectFunction() {
  var x = document.getElementById("mySelect").value;
  document.getElementById("discount").innerHTML = x + " (EUR)";
}
</script>
<p  style="font-size:25px; font-family:Book Antiqua;">Total Sum without VAT: <%=sum %> (EUR)</p>
<p  style="font-size:30px; font-family:Book Antiqua;"><b>Total Sum with VAT = </b></p><p id="discount" name = "discount"style="font-size:30px;font-weight: bold; font-family:Book Antiqua;"></p>


	<button class="button button1" name="buy" value="Save your order" >Save your order</button>
	</form>
<p style="font-size:20px">Write your <strong> voucher </strong> code and press "ENTER".</p>

<input type="search" id="myInput" name="searchy" onsearch="myFunction()">
<script >
function myFunction() {
   var x = document.getElementById("myInput");

   if(x.value == "studentdiscount"){
	   document.getElementById("discount").style.color = "red";
	   var total = Math.round(document.getElementById("mySelect").value * 0.8 *100)/100 + " (EUR)";
	   document.getElementById("discount").innerHTML = total;
	   }
}
</script>

</fieldset>
				
</div>
</body>
</html>