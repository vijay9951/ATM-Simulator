<%@page import="java.util.Scanner"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>create account</title>
<link rel="stylesheet" href="home.css" />
</head>
<body>


	<%
	String acct_no = request.getParameter("acct_no");
	String cname = request.getParameter("cname");
	String caddress = request.getParameter("caddress");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM", "root", "root");

		//	Scanner s = new Scanner(System.in);

		//	System.out.println("Enter your choice which to be your account No: ");
		//	int acct_no = s.nextInt();

		//	System.out.println("Enter your full name: ");
		//	String cname = s.next();

		//	System.out.println("Enter your address: ");
		//	String caddress = s.next();

		//	System.out.println("Enter your mobile number: ");
		//	int mobile = s.nextInt();

		//	System.out.println("Enter your Email Id: ");
		//	String email = s.next();

		String s1 = "INSERT into banking values (?,?,?,?,?) ";
//		String s2 = "insert into bank_trans values (deposit) + (?) where acct_no=?	";
		//	PreparedStatement st = con.prepareStatement("INSERT into banking (acct_no, cname, caddress, mobile, email" + "(?,?,?,?,?)",
		//	Statement.RETURN_GENERATED_KEYS);
		//	ResultSet tableKeys = st.getGeneratedKeys();
		//	st.executeUpdate();
		//	tableKeys.next();
		//	int autoGeneratedID = tableKeys.getInt(1);

		PreparedStatement st = con.prepareStatement(s1);

		st.setString(1, acct_no);
		st.setString(2, cname);
		st.setString(3, caddress);
		st.setString(4, mobile);
		st.setString(5, email);

		st.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();
	}
	/* try {
		//	String acct_no = getInitParameter("acct_no");

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ATM", "root", "root");

		String s1 = "select * from banking where acct_no=?";
		PreparedStatement pst = con.prepareStatement(s1);

		pst.setString(1, "acct_no");
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			out.println("your account is created with account no.: " + rs.getInt(1)
			+ "...Please visit nearest branch for further process..!!");
		}

	} catch (Exception e) {
		e.printStackTrace();
	} */
	out.println(
			"your account is created with account No. : " + acct_no + "....Please visit nearest branch for further process..!!");
	%>

	<a href="home.html">Back to HomePage</a>
</body>
</html>