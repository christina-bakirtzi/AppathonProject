<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="DAO.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <jsp:useBean id="user"
  class="Pack.User" />

 <jsp:setProperty property="*" name="user" />

 <%
  LoginDao logindao = new LoginDao();
  int status = logindao.insertUser(user);
  if (status > 0) {
   out.print("You are successfully registered");
  }
 %>
</body>
</html>
