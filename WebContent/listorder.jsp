<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>

<html>
<head>
<title>Ray's Grocery Order List</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<h1>Order List</h1>

<%
//TODO:
//Test
//
//



String sql = "SELECT O.oID, O.cID, totalPrice, firstName, lastName, pID, quantity, price "
		+ "FROM Orders O, Customer C, ItemInOrder OP "
		+ "WHERE O.cID = C.cID and OP.oID = O.oID "
		+ "AND O.cID = ? ";


//Placeholder value, need to have login information.
String custId = "1";// request.getParameter("customerId");

NumberFormat currFormat = NumberFormat.getCurrencyInstance();


//Using a prepared statement, we are able to only show the orders pertaining to
//a particular customer id.
try 
{	
	getConnection();
	PreparedStatement ps = con.prepareStatement(sql);
	
	//
	ps.setString(1,custId);
	ResultSet rst = ps.executeQuery();
	out.println("<table class=\"table\" border=\"1\">");
	out.print("<tr><th>Order Id</th><th>Customer Id</th><th>Customer Name</th>");
	out.println("<th>Total Amount</th></tr>");

	int lastOrderId = -1;
	double totalAmount=0, price;
	int totalQuantity=0, quantity;

	// Note: This version requires only one query rather than one for each order.  More efficient if listing all orders.
	while (rst.next())
	{	
		int orderId = rst.getInt(1);

		if (orderId != lastOrderId)
		{
			if (lastOrderId != -1)
			{
				out.print("<tr><td><span class=\"label label-primary\">Total:</span></td>");
				out.print("<td>"+totalQuantity+"</td>");
				out.println("<td>"+currFormat.format(totalAmount)+"</td></tr>");
				totalQuantity = 0;
				totalAmount = 0;
				out.println("</table></td></tr>");	// Close previous table
			}

			out.print("<tr><td>"+orderId+"</td>");

			out.print("<td>"+rst.getInt(2)+"</td>");
			out.print("<td>"+rst.getString(4)+"</td>");
			out.print("<td>"+currFormat.format(rst.getDouble(3))+"</td>");
			out.println("</tr>");
		
			out.println("<tr align=\"right\"><td colspan=\"4\"><table class=\"table\" border=\"1\">");
			out.println("<th>Product Id</th> <th>Quantity</th> <th>Price</th></tr>");
		}

		// Print lineitem information
		quantity = rst.getInt(6);
		price = rst.getDouble(7);
		totalQuantity += quantity;
		totalAmount += quantity*price;
		out.print("<tr><td>"+rst.getInt(5)+"</td>");
		out.print("<td>"+quantity+"</td>");
		out.println("<td>"+currFormat.format(price)+"</td></tr>");

		lastOrderId = orderId;
	}

	if (lastOrderId != -1)
	{		
		out.print("<tr><td><span class=\"label label-primary\">Total:</span></td>");
		out.print("<td>"+totalQuantity+"</font></td>");
		out.println("<td>"+currFormat.format(totalAmount)+"</font></td></tr>");
		totalQuantity = 0;
		totalAmount = 0;
		out.println("</table></td></tr>");	// Close previous table		
    }

	out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{
	try
	{
		closeConnection();
	}
	catch (SQLException ex)
	{
		out.println(ex); 
	}
}
%>

</body>
</html>


