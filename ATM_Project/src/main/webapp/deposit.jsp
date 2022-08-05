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
<title>Deposit</title>
</head>
<body>
	<%
	String acct_no = request.getParameter("acct_no");
	String deposit = request.getParameter("deposit");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM", "root", "root");

		String s1 = "update bank_trans set deposit=? where tr_id=" + acct_no;

		PreparedStatement st = con.prepareStatement(s1);

		//		st.setString(2, acct_no);
		st.setString(1, deposit);
		//		st.setString(1, null);
		//		st.setString(3, null);
		//		st.setString(5, deposit);

		st.executeUpdate();
		//	System.out.println(acct_no + " " + deposit);

	//	acct_no = request.getParameter("acct_no");

		//	Class.forName("com.mysql.cj.jdbc.Driver");
		//	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM", "root", "root");

		String s2 = "select balance from bank_trans where tr_id=?";
		PreparedStatement pst = con.prepareStatement(s2);

		pst.setString(1, "acct_no");
		int rs = pst.executeUpdate();

		while (rs.nextInt()) {
			out.println("your Account balance : " + rs);
		}

	} catch (Exception e) {
		e.printStackTrace();
		out.println("Account Number not found...First open account in our bank!!!");
	}
	%>
	<a href="home.html">Back to HomePage</a>
</body>
</html>