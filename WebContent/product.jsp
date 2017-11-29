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
*
*
*TODO:
*Adapt out.println for new sql tables/data, as this is currently using lab 7 data.
*Add images for the product
*add video link and reviews
*/


String id = request.getParameter("id");

String sql = "SELECT * FROM Product WHERE productId = ?";
String sql2 = "SELECT * FROM Review WHERE productId = ?";

getConnection();
PreparedStatement ps = con.prepareStatement(sql);
PreparedStatement ps2 = con.prepareStatement(sql2);


ps.setString(1,id);
ps2.setString(1,id);
ResultSet rst = ps.executeQuery();



while(rst.next()){
	
	out.print("<a href=\"addcart.jsp?id=" + rst.getInt(1) + "&name=" +rst.getString(2)
	+ "&price=" + rst.getDouble(5) + "\">Add to Cart</a></td>");
	
	out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Price</th></tr>");
	
	out.print("<tr><td>"+ rst.getInt(1)+"</td><td>"+rst.getString(2)+"</td><td>"+rst.getDouble(5)+"</td></tr>");	
	
	//out.println("Descriptiom: "+ rst.getString(3));
	//out.println("Video Link: "+ rst.getString(5));
	//out.println(rst.getImage(7));
}



con.close();
%>

<form method="get" action="review.jsp">
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

<h3>Reviews: **Add list of reviews here** </h3>
</body>
</html>