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
<title>Application form</title>
<link rel="stylesheet" href="home.css" />
</head>
<body>
	<h3>"Online Application form for opening account"</h3>

	<div class="getInput">
		<form action="createAccount.jsp">
			<input type="text" placeholder="enter your choice account number: "
				name="acct_no" id="acct_no" /> <input type="text"
				placeholder="full name" name="cname">
			<textarea cols="12" rows="5" placeholder="Address" name="caddress"></textarea>
			<input type="number" placeholder="mobile" name="mobile"> <input
				type="email" placeholder="email" name="email"> <input
				type="submit" value="submit" />
		</form>
		<a href="home.html">Back to HomePage</a>
	</div>

	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM", "root", "root");

		String s1 = "select * from banking where acct_no=?";
		PreparedStatement pst = con.prepareStatement(s1);

		pst.setString(1, "acct_no");
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			out.println(rs.getInt(1));
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>
</html>