<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title >INFORMIRACLES</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  
  
  <style>
  .img-fluid {
  max-width: 50%;
  height: auto;
  
}
 body { padding-top: 50px; }
  
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
    background-color: #5D6D7E !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}

.navbar-default .navbar-nav .open .dropdown-menu>li>a, .navbar-default .navbar-nav .open .dropdown-menu {
    background-color: #60606F;
    color:#ffffff;
  }
 

  
 </style> 
  
</head>
<body>



<div class="navbar navbar-fixed-top">
<div class="collapse navbar-collapse" id="navbarNav">

<a class="navbar-brand">INFORMIRACLES</a>



<form>


<div class="navbar-header">
<select class="form-control" id="categoryName" name="categoryName">
<option>category</option>

  
  

  
 <%  
 // Automatically Fill in catagories to the drop down
  try               
{
	getConnection();
	PreparedStatement ps = con.prepareStatement("SELECT DISTINCT categoryName FROM Product");
 	ResultSet rst = ps.executeQuery();
        while (rst.next()) 
		out.println(String.format("<option>%s</option>",rst.getString(1)));
        ps.close();
}
catch (SQLException ex)
{       out.println(ex);
}

%>
</select>
</div>


<div class="navbar-header"> 
 
      <input type="text" class="form-control" size="30" name="productName">
   </div> 
   <div class="nav-item">
        <button class="btn btn-success" role="button" type="submit" >SEARCH</button>
        </div>

   
 

</form>


<ul class="nav navbar-nav navbar-right" id="myNavbar">

 <li><a href="listOrders">ORDERS</a></li>
		<li class="nav-item"><a href="#about">ABOUT</a></li>
        <li class="nav-item"><a href="#signIn">SIGN IN</a></li>
        <li class="nav-item"><a href="#cart">CART</a></li>
		</div>
</ul>


</div>
</div>



 
  <br>
  
  
  <%
  
  
  %>
  
  
  
  <%
	// Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");

boolean hasNameParam = name != null && !name.equals("");
boolean hasCategoryParam = category != null && !category.equals("") && !category.equals("All");
String filter = "", sql = "";

if (hasNameParam && hasCategoryParam)
{
	filter = "<h3>Products containing '"+name+"' in category: '"+category+"'</h3>";
	name = '%'+name+'%';
	sql = "SELECT productId, productName, price, categoryName FROM Product WHERE productName LIKE ? AND categoryName = ?";
}
else if (hasNameParam)
{
	filter = "<h3>Products containing '"+name+"'</h3>";
	name = '%'+name+'%';
	sql = "SELECT productId, productName, price, categoryName FROM Product WHERE productName LIKE ?";
}
else if (hasCategoryParam)
{
	filter = "<h3>Products in category: '"+category+"'</h3>";
	sql = "SELECT productId, productName, price, categoryName FROM Product WHERE categoryName = ?";
}
else
{
	filter = "<h3>All Products</h3>";
	sql = "SELECT productId, productName, price, categoryName FROM Product";
}

out.println(filter);

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{
	getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	if (hasNameParam)
	{
		pstmt.setString(1, name);	
		if (hasCategoryParam)
		{
			pstmt.setString(2, category);
		}
	}
	else if (hasCategoryParam)
	{
		pstmt.setString(1, category);
	}
	
	ResultSet rst = pstmt.executeQuery();
	
	
	
	while (rst.next()) 
	{
		
		//Print image
		String imgURL = "https://paramountseeds.com/wp-content/uploads/2014/07/long-cucumber.jpg";
		String imgPrint = String.format("<div class=\"row\"> <div class=\"col-sm-4\"><img src=\"%s\" class=\"img-fluid\" alt=\"Responsive image\"></div>",imgURL);
		out.print(imgPrint);		
		
		
		out.print("<div class=\"col-sm-4\"><table align=\"Left\">");
		//add to cart
		out.print(String.format("<tr><td><a href=\"addcart.jsp?id=%d&name=%s&price=%f\">Add to Cart</a></td></tr>",rst.getInt(1),rst.getString(2),rst.getDouble(3)));
		
		String itemCategory = rst.getString(4);
	
		//fill item info
		out.print(String.format("<tr><td>%s</td></tr> <tr><td>%s</td></tr> <tr><td>%s</td></tr>",rst.getString(2),itemCategory,"$"+rst.getDouble(3)));
		
		//close off the row and stars which will be done later
		out.print(" </table>");
		
		for(int i =0; i<0;i++)
			out.print("<br>");
		
		
		out.print("</div><div class=\"col-sm-4\"><h2 align=\"center\">Stars</h2>");
		
		
		for(int i =0; i<0;i++)
			out.print("<br>");
		
		out.print("</div></div></div>");
	}
	
	
	
	closeConnection();
} catch (SQLException ex) {
	out.println(ex);
}
%>


</body>
</html>
