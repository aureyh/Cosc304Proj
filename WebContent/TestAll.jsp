<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>INFORMIRACLES</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.img-fluid {
	max-width: 25%;
	height: auto;
}

body {
	padding-top: 50px;
}

.navbar {
	margin-bottom: 0;
	background-color: #60606C;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: ##CD5F0F !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}
</style>

</head>
<body>

	<h1>PRINT EVERYTHING</h1>
	<table>

		<%
			//CUSTOMER TABLE

			try {
				getConnection();
				PreparedStatement ps = con.prepareStatement("SELECT * from Customer");
				PreparedStatement ps2 = con.prepareStatement("SELECT * from Supplier");
				PreparedStatement ps3 = con.prepareStatement("SELECT * from Product");
				PreparedStatement ps4 = con.prepareStatement("SELECT * from Tags");
				PreparedStatement ps5 = con.prepareStatement("SELECT * from Orders");
				PreparedStatement ps6 = con.prepareStatement("SELECT * from Shipment");
				PreparedStatement ps7 = con.prepareStatement("SELECT * from CustAddress");
				PreparedStatement ps8 = con.prepareStatement("SELECT * from PaymentInfo");
				PreparedStatement ps9 = con.prepareStatement("SELECT * from ShippedProduct");
				PreparedStatement ps10 = con.prepareStatement("SELECT * from Review");
				PreparedStatement ps11 = con.prepareStatement("SELECT * from Suggestion");
				PreparedStatement ps12 = con.prepareStatement("SELECT * from ItemInCart");
				PreparedStatement ps13 = con.prepareStatement("SELECT * from ItemInOrder");
				PreparedStatement ps14 = con.prepareStatement("SELECT * from HasTag");

				ResultSet rst = ps.executeQuery();
				ResultSet rst2 = ps2.executeQuery();
				ResultSet rst3 = ps3.executeQuery();
				ResultSet rst4 = ps4.executeQuery();
				ResultSet rst5 = ps5.executeQuery();
				ResultSet rst6 = ps6.executeQuery();
				ResultSet rst7 = ps7.executeQuery();
				ResultSet rst8 = ps8.executeQuery();
				ResultSet rst9 = ps9.executeQuery();
				ResultSet rst10 = ps10.executeQuery();
				ResultSet rst11 = ps11.executeQuery();
				ResultSet rst12 = ps12.executeQuery();
				ResultSet rst13 = ps13.executeQuery();
				ResultSet rst14 = ps14.executeQuery();
				
				
				out.println("<tr><th>CUSTOMERS</th></tr>");
				while (rst.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>SUPPLIERS</th></tr>");
				while (rst2.next()){int i=1;
					out.println(String.format("<tr><td>%d %s %s %s</td></tr>", rst2.getInt(i++),rst2.getString(i++),rst2.getString(i++),rst2.getString(i)));}
				ps2.close();
				out.println("<tr><th>PRODUCTS</th></tr>");
				while (rst3.next()){int i = 1;
					out.println(String.format("<tr><td>%d %s %s %s %d %s</td></tr>", rst3.getInt(i++), rst3.getString(i++), rst3.getString(i++), ""+rst3.getBigDecimal(i++), rst3.getString(i++), rst3.getInt(i++), ""+rst3.getString(i++)));}
				ps3.close();
				out.println("<tr><th>TAGS</th></tr>");
				while (rst3.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>ORDERS</th></tr>");
				while (rst4.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>SHIPMENT</th></tr>");
				while (rst5.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>CUSTADDRESS</th></tr>");
				while (rst6.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>PAYMENTINFO</th></tr>");
				while (rst7.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>SHIPPEDPRODUCT</th></tr>");
				while (rst8.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>REVIEW</th></tr>");
				while (rst9.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>ITEMINCART</th></tr>");
				while (rst10.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>ITEMINORDER</th></tr>");
				while (rst11.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();
				out.println("<tr><th>HASTAG</th></tr>");
				while (rst12.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();

				while (rst13.next())
					out.println(String.format("<tr><td>%d %s %s %s %s %s %s %s %s</td></tr>", rst.getInt(1),
							rst.getString(2), rst.getString(3), "" + rst.getDate(4), rst.getString(5), rst.getString(6),
							rst.getString(7), rst.getString(8), rst.getString(9)));
				ps.close();

			} catch (SQLException ex) {
				out.println(ex);
			}
		%>



	</table>



</body>
</html>
