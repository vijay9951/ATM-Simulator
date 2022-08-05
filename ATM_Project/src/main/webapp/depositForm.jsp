<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deposit Form</title>
</head>
<body>
<h3>"Online Application for deposit amount"</h3>

	<div class="getInput">
		<form action="deposit.jsp">
			<input type="text" placeholder="enter your account number: " name="acct_no" id="acct_no" /> 
			<input type="text" placeholder="enter amount to deposit: " name="deposit" id="deposit" /> 
			<input type="submit" value="submit" />
		</form>
		<a href="home.html">Back to HomePage</a>
	</div>
	
</body>
</html>