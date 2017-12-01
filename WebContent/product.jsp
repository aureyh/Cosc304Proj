<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="jdbc.jsp" %>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Info</title>
</head>
<body>
<%

/**
*This file lists the information about a product
*when the hyperlink is clicked from the listprod page.
*/

String id = request.getParameter("pID");

		


String sql = "SELECT * FROM Product WHERE pID = ?";
String sql2 = "SELECT * FROM Review WHERE pID = ?";

getConnection();
PreparedStatement ps = con.prepareStatement(sql);
PreparedStatement ps2 = con.prepareStatement(sql2);


//checks if the id we got from listprod is null
if(id != null){
ps.setString(1,id);
ps2.setString(1,id);
}

ResultSet rst = ps.executeQuery();
ResultSet rst2 = ps2.executeQuery();


//This prints the add cart, as well as the product information
while(rst.next()){
	
	out.print("<a href=\"addcart.jsp?id=" + rst.getInt(1) + "&name=" +rst.getString(2)
	+ "&price=" + rst.getBigDecimal(4) + "\">Add to Cart</a></td>");
	
	out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Price</th></tr>");
	
	out.print("<tr><td>"+ rst.getInt(1)+"</td><td>"+rst.getString(2)+"</td><td>"+rst.getBigDecimal(4)+"</td></tr>");	
	
	out.print("\n" + "Description: "+ rst.getString(3));
	out.print("\n"+"Video Link: "+ rst.getString(5));
	out.print( "\n" + rst.getString(7));
}



//This is where the reviews are printed
%>
Heres what People are saying about this product<br/>
<%
while(rst2.next()){
	out.print("<table><tr><td>Stars: </td><td>Comments: </td></tr>");
	out.println("<tr><td>" + rst2.getString(2) + "</td><td>" + rst2.getString(3) + "</td></tr>");
	}

out.print("</table></table>");

//everything here is used for writing the review and sending it.
out.print("<form method=\"post\" action=\"review.jsp\">");

session.setAttribute("prodID",id);
%>

<table>
<tr><td>Rank This Product</td><td><select name="stars">
  <option value=1>1</option>
  <option value=2>2</option>
  <option value=3>3</option>
  <option value=4>4</option>
  <option value=5>5</option>
</select>
<tr><td>Leave a Review</td><td><textarea name="rev" rows="10" cols="50"></textarea></td></tr>
<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
</table>
</form>

<%con.close(); %>
</body>
</html>